// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoEntityData _$UserInfoEntityDataFromJson(Map json) => UserInfoEntityData(
  id: json['id'] as String?,
  key: json['key'] as String,
  value: json['value'] as String,
);

Map<String, dynamic> _$UserInfoEntityDataToJson(UserInfoEntityData instance) =>
    <String, dynamic>{
      if (Converters.id(instance.id) case final value?) 'id': value,
      'key': instance.key,
      'value': instance.value,
    };
