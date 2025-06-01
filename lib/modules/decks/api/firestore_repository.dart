import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:vibed/modules/decks/api/entities/card_entity.dart';
import 'package:vibed/modules/decks/api/entities/category_entity.dart';
import 'package:vibed/modules/decks/api/entities/deck_entity.dart';
import 'package:vibed/modules/decks/api/entities/section_entity.dart';

final firestoreRepositoryProvider = Provider<FirestoreRepository>(
  (ref) => FirestoreRepository(firestore: FirebaseFirestore.instance),
);

class FirestoreRepository {
  final FirebaseFirestore _firestore;
  final Logger _logger = Logger();

  FirestoreRepository({required FirebaseFirestore firestore})
    : _firestore = firestore;

  // Fetch all categories
  Future<List<CategoryEntity>> getCategories() async {
    try {
      final snapshot = await _firestore.collection('categories').get();
      return snapshot.docs
          .map((doc) => CategoryEntity.fromJson(doc.id, doc.data()))
          .toList();
    } catch (e, stackTrace) {
      _logger.e('Error fetching categories', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // Fetch all sections
  Future<List<SectionEntity>> getSections() async {
    try {
      final snapshot = await _firestore.collection('sections').get();
      return snapshot.docs
          .map((doc) => SectionEntity.fromJson(doc.id, doc.data()))
          .toList();
    } catch (e, stackTrace) {
      _logger.e('Error fetching sections', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // Fetch sections by category
  Future<List<SectionEntity>> getSectionsByCategory(String categoryId) async {
    try {
      final snapshot = await _firestore
          .collection('sections')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      return snapshot.docs
          .map((doc) => SectionEntity.fromJson(doc.id, doc.data()))
          .toList();
    } catch (e, stackTrace) {
      _logger.e(
        'Error fetching sections by category',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // Fetch all decks
  Future<List<DeckEntity>> getDecks() async {
    try {
      final snapshot = await _firestore.collection('decks').get();
      return snapshot.docs
          .map((doc) => DeckEntity.fromJson(doc.id, doc.data()))
          .toList();
    } catch (e, stackTrace) {
      _logger.e('Error fetching decks', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // Fetch decks by category
  Future<List<DeckEntity>> getDecksByCategory(String categoryId) async {
    try {
      final snapshot = await _firestore
          .collection('decks')
          .where('categoryId', isEqualTo: categoryId)
          .get();
      return snapshot.docs
          .map((doc) => DeckEntity.fromJson(doc.id, doc.data()))
          .toList();
    } catch (e, stackTrace) {
      _logger.e(
        'Error fetching decks by category',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // Fetch decks by IDs
  Future<List<DeckEntity>> getDecksByIds(List<String> deckIds) async {
    try {
      if (deckIds.isEmpty) return [];

      // Firestore 'in' query is limited to 10 items, so we need to batch
      final List<DeckEntity> allDecks = [];

      for (int i = 0; i < deckIds.length; i += 10) {
        final batch = deckIds.skip(i).take(10).toList();
        final snapshot = await _firestore
            .collection('decks')
            .where(FieldPath.documentId, whereIn: batch)
            .get();

        allDecks.addAll(
          snapshot.docs.map((doc) => DeckEntity.fromJson(doc.id, doc.data())),
        );
      }

      return allDecks;
    } catch (e, stackTrace) {
      _logger.e(
        'Error fetching decks by IDs',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // Fetch all cards
  Future<List<CardEntity>> getCards() async {
    try {
      final snapshot = await _firestore.collection('cards').get();
      return snapshot.docs
          .map((doc) => CardEntity.fromJson(doc.id, doc.data()))
          .toList();
    } catch (e, stackTrace) {
      _logger.e('Error fetching cards', error: e, stackTrace: stackTrace);
      rethrow;
    }
  }

  // Fetch cards by deck ID
  Future<List<CardEntity>> getCardsByDeck(String deckId) async {
    try {
      final snapshot = await _firestore
          .collection('cards')
          .where('deckId', isEqualTo: deckId)
          .get();
      return snapshot.docs
          .map((doc) => CardEntity.fromJson(doc.id, doc.data()))
          .toList();
    } catch (e, stackTrace) {
      _logger.e(
        'Error fetching cards by deck',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  // Get featured deck (first non-locked deck)
  Future<DeckEntity?> getFeaturedDeck({String? categoryId}) async {
    try {
      Query query = _firestore
          .collection('decks')
          .where('isLocked', isEqualTo: false);

      if (categoryId != null) {
        query = query.where('categoryId', isEqualTo: categoryId);
      }

      final snapshot = await query.limit(1).get();

      if (snapshot.docs.isEmpty) return null;

      final doc = snapshot.docs.first;
      return DeckEntity.fromJson(doc.id, doc.data() as Map<String, dynamic>);
    } catch (e, stackTrace) {
      _logger.e(
        'Error fetching featured deck',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
