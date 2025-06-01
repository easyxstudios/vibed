// ignore_for_file: invalid_annotation_target

import 'package:vibed/core/data/entities/json_converters.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deck_entity.freezed.dart';
part 'deck_entity.g.dart';

enum DeckCategory { popular, party, relationship, adult }

@freezed
sealed class DeckEntity with _$DeckEntity {
  const factory DeckEntity({
    @JsonKey(includeIfNull: false, toJson: Converters.id) String? id,
    required String title,
    required String subtitle,
    required String imageUrl,
    required int fireCount,
    required bool isLocked,
    required String unlockText,
    required String categoryId,
    required List<String> cardIds,
    required DeckCategory category,
    required bool isPremium,
    required int sortOrder,
    required bool active,
    @TimestampConverter() DateTime? creationDate,
    @TimestampConverter() DateTime? lastUpdateDate,
  }) = DeckEntityData;

  const DeckEntity._();

  factory DeckEntity.fromJson(String id, Map<String, dynamic> json) =>
      _$DeckEntityFromJson(json..['id'] = id);
}
