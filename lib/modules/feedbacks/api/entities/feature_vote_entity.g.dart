// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_vote_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFeatureVoteEntityData _$UserFeatureVoteEntityDataFromJson(Map json) =>
    UserFeatureVoteEntityData(
      id: json['id'] as String?,
      creationDate: const TimestampConverter().fromJson(
        json['creation_date'] as Timestamp,
      ),
      userId: json['userId'] as String,
      featureId: json['featureId'] as String,
    );

Map<String, dynamic> _$UserFeatureVoteEntityDataToJson(
  UserFeatureVoteEntityData instance,
) => <String, dynamic>{
  if (Converters.id(instance.id) case final value?) 'id': value,
  'creation_date': const TimestampConverter().toJson(instance.creationDate),
  'userId': instance.userId,
  'featureId': instance.featureId,
};
