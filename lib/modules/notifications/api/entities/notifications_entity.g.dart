// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationEntityData _$NotificationEntityDataFromJson(Map json) =>
    NotificationEntityData(
      id: json['id'] as String?,
      title: json['title'] as String,
      body: json['body'] as String,
      creationDate: const TimestampConverter().fromJson(
        json['creation_date'] as Timestamp,
      ),
      readDate: _$JsonConverterFromJson<Timestamp, DateTime>(
        json['seen_date'],
        const TimestampConverter().fromJson,
      ),
      type: $enumDecodeNullable(_$NotificationTypesEnumMap, json['type']),
      data: (json['data'] as Map?)?.map((k, e) => MapEntry(k as String, e)),
    );

Map<String, dynamic> _$NotificationEntityDataToJson(
  NotificationEntityData instance,
) => <String, dynamic>{
  if (Converters.id(instance.id) case final value?) 'id': value,
  'title': instance.title,
  'body': instance.body,
  'creation_date': const TimestampConverter().toJson(instance.creationDate),
  'seen_date': _$JsonConverterToJson<Timestamp, DateTime>(
    instance.readDate,
    const TimestampConverter().toJson,
  ),
  'type': _$NotificationTypesEnumMap[instance.type],
  'data': instance.data,
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

const _$NotificationTypesEnumMap = {
  NotificationTypes.WELCOME: 'WELCOME',
  NotificationTypes.OTHER: 'OTHER',
  NotificationTypes.LINK: 'LINK',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
