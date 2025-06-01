// ignore_for_file: invalid_annotation_target

import 'package:vibed/core/data/entities/json_converters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'section_entity.freezed.dart';
part 'section_entity.g.dart';

@freezed
sealed class SectionEntity with _$SectionEntity {
  const factory SectionEntity({
    @JsonKey(includeIfNull: false, toJson: Converters.id) String? id,
    required String title,
    required String subtitle,
    required String categoryId,
    required List<String> deckIds,
    required int sortOrder,
    required bool isFeatured,
    required bool active,
    @TimestampConverter() DateTime? creationDate,
    @TimestampConverter() DateTime? lastUpdateDate,
  }) = SectionEntityData;

  const SectionEntity._();

  factory SectionEntity.fromJson(String id, Map<String, dynamic> json) =>
      _$SectionEntityFromJson(json..['id'] = id);
}
