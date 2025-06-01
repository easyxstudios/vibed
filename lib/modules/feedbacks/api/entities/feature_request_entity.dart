// ignore: depend_on_referenced_packages
// ignore_for_file: invalid_annotation_target

import 'package:vibed/core/data/entities/json_converters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feature_request_entity.freezed.dart';
part 'feature_request_entity.g.dart';

@freezed
sealed class FeatureRequestEntity with _$FeatureRequestEntity {
  const factory FeatureRequestEntity({
    @JsonKey(includeIfNull: false, toJson: Converters.id) String? id,
    @TimestampConverter() required DateTime creationDate,
    @TimestampConverter() required DateTime lastUpdateDate,
    required Map<String, String> title,
    required Map<String, String> description,
    required int votes,
    required bool active, // votes are enabled for this feature
  }) = FeatureRequestEntityData;

  const FeatureRequestEntity._();

  factory FeatureRequestEntity.fromJson(String id, Map<String, dynamic> json) =>
      _$FeatureRequestEntityFromJson(json..['id'] = id);
}
