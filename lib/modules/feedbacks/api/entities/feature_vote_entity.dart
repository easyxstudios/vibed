// ignore: depend_on_referenced_packages
// ignore_for_file: invalid_annotation_target

import 'package:vibed/core/data/entities/json_converters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_vote_entity.freezed.dart';
part 'feature_vote_entity.g.dart';

@freezed
abstract class UserFeatureVoteEntity with _$UserFeatureVoteEntity {
  const factory UserFeatureVoteEntity({
    @JsonKey(includeIfNull: false, toJson: Converters.id) String? id,
    @JsonKey(name: 'creation_date')
    @TimestampConverter()
    required DateTime creationDate,
    required String userId,
    required String featureId,
  }) = UserFeatureVoteEntityData;

  const UserFeatureVoteEntity._();

  factory UserFeatureVoteEntity.fromJson(
          String id, Map<String, dynamic> json) =>
      _$UserFeatureVoteEntityFromJson(json..['id'] = id);
}
