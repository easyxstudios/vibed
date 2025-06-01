// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceEntityData _$DeviceEntityDataFromJson(Map json) => DeviceEntityData(
  id: json['id'] as String?,
  creationDate: const TimestampConverter().fromJson(
    json['creationDate'] as Timestamp,
  ),
  lastUpdateDate: const TimestampConverter().fromJson(
    json['lastUpdateDate'] as Timestamp,
  ),
  installationId: json['installationId'] as String,
  token: json['token'] as String,
  operatingSystem: $enumDecode(
    _$OperatingSystemEnumMap,
    json['operatingSystem'],
  ),
);

Map<String, dynamic> _$DeviceEntityDataToJson(
  DeviceEntityData instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  'creationDate': const TimestampConverter().toJson(instance.creationDate),
  'lastUpdateDate': const TimestampConverter().toJson(instance.lastUpdateDate),
  'installationId': instance.installationId,
  'token': instance.token,
  'operatingSystem': _$OperatingSystemEnumMap[instance.operatingSystem]!,
};

const _$OperatingSystemEnumMap = {
  OperatingSystem.ios: 'ios',
  OperatingSystem.android: 'android',
};
