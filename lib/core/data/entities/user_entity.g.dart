// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntityData _$UserEntityDataFromJson(Map json) => UserEntityData(
  id: json['id'] as String?,
  creationDate: _$JsonConverterFromJson<Timestamp, DateTime>(
    json['creation_date'],
    const TimestampConverter().fromJson,
  ),
  lastUpdateDate: _$JsonConverterFromJson<Timestamp, DateTime>(
    json['last_update_date'],
    const TimestampConverter().fromJson,
  ),
  name: json['name'] as String?,
  email: json['email'] as String?,
  avatarPath: json['avatarPath'] as String?,
  onboarded: json['onboarded'] as bool?,
);

Map<String, dynamic> _$UserEntityDataToJson(UserEntityData instance) =>
    <String, dynamic>{
      if (Converters.id(instance.id) case final value?) 'id': value,
      'creation_date': _$JsonConverterToJson<Timestamp, DateTime>(
        instance.creationDate,
        const TimestampConverter().toJson,
      ),
      'last_update_date': _$JsonConverterToJson<Timestamp, DateTime>(
        instance.lastUpdateDate,
        const TimestampConverter().toJson,
      ),
      'name': instance.name,
      'email': instance.email,
      'avatarPath': instance.avatarPath,
      'onboarded': instance.onboarded,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
