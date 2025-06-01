// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryEntityData _$CategoryEntityDataFromJson(Map json) => CategoryEntityData(
  id: json['id'] as String?,
  key: json['key'] as String,
  name: Map<String, String>.from(json['name'] as Map),
  description: Map<String, String>.from(json['description'] as Map),
  color: json['color'] as String,
  icon: json['icon'] as String,
  sortOrder: (json['sortOrder'] as num).toInt(),
  active: json['active'] as bool,
  creationDate: _$JsonConverterFromJson<Timestamp, DateTime>(
    json['creationDate'],
    const TimestampConverter().fromJson,
  ),
  lastUpdateDate: _$JsonConverterFromJson<Timestamp, DateTime>(
    json['lastUpdateDate'],
    const TimestampConverter().fromJson,
  ),
);

Map<String, dynamic> _$CategoryEntityDataToJson(CategoryEntityData instance) =>
    <String, dynamic>{
      if (Converters.id(instance.id) case final value?) 'id': value,
      'key': instance.key,
      'name': instance.name,
      'description': instance.description,
      'color': instance.color,
      'icon': instance.icon,
      'sortOrder': instance.sortOrder,
      'active': instance.active,
      'creationDate': _$JsonConverterToJson<Timestamp, DateTime>(
        instance.creationDate,
        const TimestampConverter().toJson,
      ),
      'lastUpdateDate': _$JsonConverterToJson<Timestamp, DateTime>(
        instance.lastUpdateDate,
        const TimestampConverter().toJson,
      ),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
