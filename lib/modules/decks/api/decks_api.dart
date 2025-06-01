import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibed/core/data/api/storage_api.dart';
import 'package:vibed/modules/decks/api/entities/deck_entity.dart';

final decksApiProvider = Provider<DecksApi>(
  (ref) => DecksApi(
    client: FirebaseFirestore.instance,
    storageApi: ref.read(storageApiProvider),
  ),
);

class DecksApi {
  final FirebaseFirestore _client;
  final StorageApi _storageApi;

  DecksApi({required FirebaseFirestore client, required StorageApi storageApi})
    : _client = client,
      _storageApi = storageApi;

  Future<List<DeckEntity>> getDecks() async {
    try {
      final res = await _client
          .collection('decks')
          .where('active', isEqualTo: true)
          .orderBy('creation_date', descending: true)
          .get();

      return res.docs
          .map((doc) => DeckEntity.fromJson(doc.id, doc.data()))
          .toList();
    } catch (e, stacktrace) {
      throw Exception('Failed to get decks: $e: $stacktrace');
    }
  }

  Future<List<DeckEntity>> getDecksByCategory(DeckCategory category) async {
    try {
      final res = await _client
          .collection('decks')
          .where('category', isEqualTo: category.name)
          .where('active', isEqualTo: true)
          .orderBy('creation_date', descending: true)
          .get();

      return res.docs
          .map((doc) => DeckEntity.fromJson(doc.id, doc.data()))
          .toList();
    } catch (e, stacktrace) {
      throw Exception('Failed to get decks by category: $e: $stacktrace');
    }
  }

  Future<DeckEntity?> getDeck(String id) async {
    try {
      final doc = await _client.collection('decks').doc(id).get();

      if (!doc.exists || doc.data() == null) {
        return null;
      }

      return DeckEntity.fromJson(doc.id, doc.data()!);
    } catch (e, stacktrace) {
      throw Exception('Failed to get deck: $e: $stacktrace');
    }
  }
}
