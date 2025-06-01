// ignore: depend_on_referenced_packages
// ignore_for_file: invalid_annotation_target

import 'package:vibed/core/data/entities/json_converters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_feature_request_entity.freezed.dart';
part 'user_feature_request_entity.g.dart';

@freezed
abstract class UserFeatureRequestEntity with _$UserFeatureRequestEntity {
  const factory UserFeatureRequestEntity({
    @JsonKey(includeIfNull: false, toJson: Converters.id) String? id,
    @JsonKey(name: 'creation_date')
    @TimestampConverter()
    required DateTime creationDate,
    required String title,
    required String description,
    required String userId,
  }) = UserFeatureRequestEntityData;

  const UserFeatureRequestEntity._();

  factory UserFeatureRequestEntity.fromJson(
          String id, Map<String, dynamic> json) =>
      _$UserFeatureRequestEntityFromJson(json..['id'] = id);
}
