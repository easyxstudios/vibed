// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_feature_request_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFeatureRequestEntityData _$UserFeatureRequestEntityDataFromJson(Map json) =>
    UserFeatureRequestEntityData(
      id: json['id'] as String?,
      creationDate: const TimestampConverter().fromJson(
        json['creation_date'] as Timestamp,
      ),
      title: json['title'] as String,
      description: json['description'] as String,
      userId: json['userId'] as String,
    );

Map<String, dynamic> _$UserFeatureRequestEntityDataToJson(
  UserFeatureRequestEntityData instance,
) => <String, dynamic>{
  if (Converters.id(instance.id) case final value?) 'id': value,
  'creation_date': const TimestampConverter().toJson(instance.creationDate),
  'title': instance.title,
  'description': instance.description,
  'userId': instance.userId,
};
