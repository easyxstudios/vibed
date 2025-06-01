// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_request_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureRequestEntityData _$FeatureRequestEntityDataFromJson(Map json) =>
    FeatureRequestEntityData(
      id: json['id'] as String?,
      creationDate: const TimestampConverter().fromJson(
        json['creationDate'] as Timestamp,
      ),
      lastUpdateDate: const TimestampConverter().fromJson(
        json['lastUpdateDate'] as Timestamp,
      ),
      title: Map<String, String>.from(json['title'] as Map),
      description: Map<String, String>.from(json['description'] as Map),
      votes: (json['votes'] as num).toInt(),
      active: json['active'] as bool,
    );

Map<String, dynamic> _$FeatureRequestEntityDataToJson(
  FeatureRequestEntityData instance,
) => <String, dynamic>{
  if (Converters.id(instance.id) case final value?) 'id': value,
  'creationDate': const TimestampConverter().toJson(instance.creationDate),
  'lastUpdateDate': const TimestampConverter().toJson(instance.lastUpdateDate),
  'title': instance.title,
  'description': instance.description,
  'votes': instance.votes,
  'active': instance.active,
};
