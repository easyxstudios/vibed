import 'package:vibed/modules/decks/api/entities/deck_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'deck.freezed.dart';

@freezed
sealed class Deck with _$Deck {
  const factory Deck({
    required String id,
    required String title,
    required String subtitle,
    required String imageUrl,
    required int fireCount,
    required bool isLocked,
    required String unlockText,
    required DeckCategory category,
    DateTime? creationDate,
    DateTime? lastUpdateDate,
  }) = DeckData;

  const Deck._();

  // Computed properties for fire badge
  int get totalFireCount => 3; // Always show 3 fire slots
  int get activeFireCount => fireCount; // Active fires based on fireCount

  factory Deck.fromEntity(DeckEntity entity) {
    return Deck(
      id: entity.id ?? '',
      title: entity.title,
      subtitle: entity.subtitle,
      imageUrl: entity.imageUrl,
      fireCount: entity.fireCount,
      isLocked: entity.isLocked,
      unlockText: entity.unlockText,
      category: entity.category,
      creationDate: entity.creationDate,
      lastUpdateDate: entity.lastUpdateDate,
    );
  }
}
