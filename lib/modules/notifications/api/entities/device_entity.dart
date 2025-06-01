// ignore: depend_on_referenced_packages
// ignore_for_file: invalid_annotation_target

import 'package:vibed/core/data/entities/json_converters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_entity.freezed.dart';
part 'device_entity.g.dart';

enum OperatingSystem {
  @JsonValue('ios')
  ios,
  @JsonValue('android')
  android,
}

@freezed
sealed class DeviceEntity with _$DeviceEntity {
  const factory DeviceEntity({
    @JsonKey(includeIfNull: false) String? id,
    @TimestampConverter() required DateTime creationDate,
    @TimestampConverter() required DateTime lastUpdateDate,
    required String installationId,
    required String token,
    required OperatingSystem operatingSystem,
  }) = DeviceEntityData;

  const DeviceEntity._();

  factory DeviceEntity.fromJson(String id, Map<String, dynamic> json) =>
      _$DeviceEntityFromJson(json..['id'] = id);

  factory DeviceEntity.fromPrefs(Map<String, dynamic> json) {
    final installationId = json['installationId'] as String?;
    return DeviceEntity(
      id: json['id'] as String?,
      installationId: installationId ?? '',
      token: json['token'] as String? ?? '',
      operatingSystem: OperatingSystem.values.firstWhere(
        (e) => e.name == json['operatingSystem'] as String?,
        orElse: () => throw Exception(
          "Operating system not found for ${json['operatingSystem']}",
        ),
      ),
      creationDate: DateTime.parse(json['creationDate'] as String),
      lastUpdateDate: DateTime.parse(json['lastUpdateDate'] as String),
    );
  }

  Map<String, dynamic> toJsonForPrefs() => {
        'id': id,
        'installationId': installationId,
        'token': token,
        'operatingSystem': operatingSystem.name,
        'creationDate': creationDate.toIso8601String(),
        'lastUpdateDate': lastUpdateDate.toIso8601String(),
      };
}
