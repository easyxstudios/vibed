// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardEntityData _$CardEntityDataFromJson(Map json) => CardEntityData(
  id: json['id'] as String?,
  title: json['title'] as String,
  content: json['content'] as String,
  categoryId: json['categoryId'] as String,
  difficultyLevel: (json['difficultyLevel'] as num).toInt(),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  isPremium: json['isPremium'] as bool,
  creationDate: _$JsonConverterFromJson<Timestamp, DateTime>(
    json['creationDate'],
    const TimestampConverter().fromJson,
  ),
  lastUpdateDate: _$JsonConverterFromJson<Timestamp, DateTime>(
    json['lastUpdateDate'],
    const TimestampConverter().fromJson,
  ),
);

Map<String, dynamic> _$CardEntityDataToJson(CardEntityData instance) =>
    <String, dynamic>{
      if (Converters.id(instance.id) case final value?) 'id': value,
      'title': instance.title,
      'content': instance.content,
      'categoryId': instance.categoryId,
      'difficultyLevel': instance.difficultyLevel,
      'tags': instance.tags,
      'isPremium': instance.isPremium,
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
