import 'package:vibed/modules/onboarding/api/entities/user_info_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final userInfosApiProvider = Provider<UserInfosApi>(
  (ref) => UserInfosApi(
    client: FirebaseFirestore.instance,
  ),
);

class UserInfosApi {
  final FirebaseFirestore _client;
  // ignore: unused_field
  final Logger _logger;

  UserInfosApi({
    required FirebaseFirestore client,
  })  : _client = client,
        _logger = Logger();

  CollectionReference<UserInfoEntity?> _collection(String userId) =>
      _client.collection('users').doc(userId).collection("infos").withConverter(
            fromFirestore: (snapshot, _) {
              if (snapshot.exists) {
                return UserInfoEntity.fromJson(snapshot.id, snapshot.data()!);
              }
              return null;
            },
            toFirestore: (data, _) => data!.toJson(),
          );

  Future<List<UserInfoEntity>> getAll(String userId) async {
    return _collection(userId).get().then((value) {
      if (value.docs.isEmpty) {
        return [];
      }
      return value.docs.map((el) => el.data()!).toList();
    });
  }

  Future<UserInfoEntity?> get(String userId, String id) async {
    return _collection(userId).doc(id).get().then((value) => value.data());
  }

  Future<UserInfoEntity?> getByKey(String userId, String key) async {
    return _collection(userId)
        .where("key", isEqualTo: key)
        .get()
        .then((value) => value.docs.firstOrNull?.data());
  }

  Future<void> update(String userId, UserInfoEntity info) async {
    await _collection(userId).doc(info.id).set(info);
  }

  Future<void> delete(String userId, String id) async {
    await _collection(userId).doc(id).delete();
  }

  Future<void> deleteAll(String userId) async {
    final infos = await getAll(userId);
    for (final info in infos) {
      await delete(userId, info.id!);
    }
  }

  Future<void> create(String userId, UserInfoEntity info) async {
    await _collection(userId).add(info);
  }
}
