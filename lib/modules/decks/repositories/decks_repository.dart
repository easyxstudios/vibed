import 'package:vibed/modules/decks/api/decks_api.dart';
import 'package:vibed/modules/decks/api/entities/deck_entity.dart'
    show DeckCategory;
import 'package:vibed/modules/decks/domain/deck.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final decksRepositoryProvider = Provider<DecksRepository>(
  (ref) => DecksRepository(decksApi: ref.read(decksApiProvider)),
);

class DecksRepository {
  final DecksApi _decksApi;

  DecksRepository({required DecksApi decksApi}) : _decksApi = decksApi;

  Future<List<Deck>> getDecks() async {
    final deckEntities = await _decksApi.getDecks();
    return deckEntities.map((entity) => Deck.fromEntity(entity)).toList();
  }

  Future<List<Deck>> getDecksByCategory(DeckCategory category) async {
    final deckEntities = await _decksApi.getDecksByCategory(category);
    return deckEntities.map((entity) => Deck.fromEntity(entity)).toList();
  }

  Future<Deck?> getDeck(String id) async {
    final deckEntity = await _decksApi.getDeck(id);
    if (deckEntity == null) {
      return null;
    }
    return Deck.fromEntity(deckEntity);
  }
}
