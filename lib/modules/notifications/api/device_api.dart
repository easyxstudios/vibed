import 'dart:async';
import 'package:universal_io/io.dart';

import 'package:vibed/core/data/api/base_api_exceptions.dart';
import 'package:vibed/modules/notifications/api/entities/device_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class DeviceApi {
  /// We use a unique id for the device / installation
  /// This allows to send notifications to a specific device
  /// iOS and Android tends now to restrict the use of device id
  /// You could also generate your own id and store it in the device
  /// But as we use firebase for notifications we can use the firebase installation id
  Future<DeviceEntity> get();

  /// Register the device in the backend
  /// Of course your backend should check if the device is already registered
  /// throws an [ApiError] if something goes wrong
  Future<DeviceEntity> register(String userId, DeviceEntity device);

  /// Update the device in the backend
  /// throws an [ApiError] if something goes wrong
  Future<DeviceEntity> update(DeviceEntity device);

  /// Unregister the device in the backend
  Future<void> unregister(String userId, String deviceId);

  /// Listen to token refresh
  void onTokenRefresh(OnTokenRefresh onTokenRefresh);

  /// Remove the token refresh listener
  void removeOnTokenRefreshListener();
}

typedef OnTokenRefresh = void Function(String token);

final deviceApiProvider = Provider<DeviceApi>(
  (ref) => FirebaseDeviceApi(
    messaging: FirebaseMessaging.instance,
    installations: FirebaseInstallations.instance,
    client: FirebaseFirestore.instance,
  ),
);

class FirebaseDeviceApi implements DeviceApi {
  final FirebaseMessaging _messaging;
  final FirebaseFirestore _client;
  final FirebaseInstallations _installations;
  StreamSubscription? _onTokenRefreshSubscription;

  FirebaseDeviceApi({
    required FirebaseFirestore client,
    required FirebaseMessaging messaging,
    required FirebaseInstallations installations,
  })  : _messaging = messaging,
        _client = client,
        _installations = installations;

  CollectionReference<DeviceEntity?> _collection(String userId) => _client
      .collection('users')
      .doc(userId)
      .collection('devices')
      .withConverter(
        fromFirestore: (snapshot, _) {
          if (snapshot.exists) {
            return DeviceEntity.fromJson(snapshot.id, snapshot.data()!);
          }
          return null;
        },
        toFirestore: (data, _) => data!.toJson(),
      );

  Query<DeviceEntity?> get _group =>
      _client.collectionGroup('devices').withConverter(
            fromFirestore: (snapshot, _) {
              if (snapshot.exists) {
                return DeviceEntity.fromJson(snapshot.id, snapshot.data()!);
              }
              return null;
            },
            toFirestore: (data, _) => data!.toJson(),
          );

  @override
  Future<DeviceEntity> get() async {
    try {
      final installationId = await _installations.getId();
      final token = await _messaging.getToken();
      final os = Platform.isAndroid
          ? OperatingSystem.android //
          : OperatingSystem.ios;
      return DeviceEntity(
        installationId: installationId,
        token: token!,
        operatingSystem: os,
        creationDate: DateTime.now(),
        lastUpdateDate: DateTime.now(),
      );
    } catch (e) {
      throw ApiError(
        code: 0,
        message: '$e',
      );
    }
  }

  @override
  Future<DeviceEntity> register(String userId, DeviceEntity device) async {
    try {
      await _collection(userId).doc(device.installationId).set(device);
      return device;
    } catch (e, trace) {
      throw ApiError(
        code: 0,
        message: '$e : $trace',
      );
    }
  }

  @override
  Future<DeviceEntity> update(DeviceEntity device) async {
    try {
      final doc = await _group
          .where("installationId", isEqualTo: device.installationId)
          .get();
      if (doc.docs.isEmpty) {
        throw ApiError(
          code: 0,
          message: 'Device not found',
        );
      }
      await doc.docs.first.reference.set(device);
      return device;
    } catch (e, trace) {
      throw ApiError(
        code: 0,
        message: '$e: $trace',
      );
    }
  }

  @override
  Future<void> unregister(String userId, String deviceId) async {
    try {
      await _collection(userId).doc(deviceId).delete();
    } catch (e) {
      throw ApiError(
        code: 0,
        message: '$e',
      );
    }
  }

  @override
  void onTokenRefresh(OnTokenRefresh onTokenRefresh) {
    _onTokenRefreshSubscription =
        _messaging.onTokenRefresh.listen((data) => onTokenRefresh(data));
  }

  @override
  void removeOnTokenRefreshListener() {
    _onTokenRefreshSubscription?.cancel();
  }
}
