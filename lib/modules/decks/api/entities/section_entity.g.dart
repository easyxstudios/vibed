// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SectionEntityData _$SectionEntityDataFromJson(Map json) => SectionEntityData(
  id: json['id'] as String?,
  title: json['title'] as String,
  subtitle: json['subtitle'] as String,
  categoryId: json['categoryId'] as String,
  deckIds: (json['deckIds'] as List<dynamic>).map((e) => e as String).toList(),
  sortOrder: (json['sortOrder'] as num).toInt(),
  isFeatured: json['isFeatured'] as bool,
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

Map<String, dynamic> _$SectionEntityDataToJson(SectionEntityData instance) =>
    <String, dynamic>{
      if (Converters.id(instance.id) case final value?) 'id': value,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'categoryId': instance.categoryId,
      'deckIds': instance.deckIds,
      'sortOrder': instance.sortOrder,
      'isFeatured': instance.isFeatured,
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
