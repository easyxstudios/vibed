// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deck_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeckEntityData _$DeckEntityDataFromJson(Map json) => DeckEntityData(
  id: json['id'] as String?,
  title: json['title'] as String,
  subtitle: json['subtitle'] as String,
  imageUrl: json['imageUrl'] as String,
  fireCount: (json['fireCount'] as num).toInt(),
  isLocked: json['isLocked'] as bool,
  unlockText: json['unlockText'] as String,
  categoryId: json['categoryId'] as String,
  cardIds: (json['cardIds'] as List<dynamic>).map((e) => e as String).toList(),
  category: $enumDecode(_$DeckCategoryEnumMap, json['category']),
  isPremium: json['isPremium'] as bool,
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

Map<String, dynamic> _$DeckEntityDataToJson(DeckEntityData instance) =>
    <String, dynamic>{
      if (Converters.id(instance.id) case final value?) 'id': value,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'imageUrl': instance.imageUrl,
      'fireCount': instance.fireCount,
      'isLocked': instance.isLocked,
      'unlockText': instance.unlockText,
      'categoryId': instance.categoryId,
      'cardIds': instance.cardIds,
      'category': _$DeckCategoryEnumMap[instance.category]!,
      'isPremium': instance.isPremium,
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

const _$DeckCategoryEnumMap = {
  DeckCategory.popular: 'popular',
  DeckCategory.party: 'party',
  DeckCategory.relationship: 'relationship',
  DeckCategory.adult: 'adult',
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
