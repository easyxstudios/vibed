// ignore_for_file: invalid_annotation_target

import 'package:vibed/core/data/entities/json_converters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_entity.freezed.dart';
part 'card_entity.g.dart';

@freezed
sealed class CardEntity with _$CardEntity {
  const factory CardEntity({
    @JsonKey(includeIfNull: false, toJson: Converters.id) String? id,
    required String title,
    required String content,
    required String categoryId,
    required int difficultyLevel, // 1-3
    required List<String> tags,
    required bool isPremium,
    @TimestampConverter() DateTime? creationDate,
    @TimestampConverter() DateTime? lastUpdateDate,
  }) = CardEntityData;

  const CardEntity._();

  factory CardEntity.fromJson(String id, Map<String, dynamic> json) =>
      _$CardEntityFromJson(json..['id'] = id);
}
