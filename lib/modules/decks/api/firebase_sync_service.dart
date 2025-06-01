import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:vibed/modules/decks/api/entities/card_entity.dart';
import 'package:vibed/modules/decks/api/entities/category_entity.dart';
import 'package:vibed/modules/decks/api/entities/deck_entity.dart';
import 'package:vibed/modules/decks/api/entities/section_entity.dart';
import 'package:vibed/modules/decks/data/sample_data.dart';

final firebaseSyncServiceProvider = Provider<FirebaseSyncService>(
  (ref) => FirebaseSyncService(firestore: FirebaseFirestore.instance),
);

class SyncProgress {
  final String message;
  final double progress; // 0.0 to 1.0
  final bool isCompleted;
  final String? error;

  SyncProgress({
    required this.message,
    required this.progress,
    this.isCompleted = false,
    this.error,
  });

  SyncProgress copyWith({
    String? message,
    double? progress,
    bool? isCompleted,
    String? error,
  }) {
    return SyncProgress(
      message: message ?? this.message,
      progress: progress ?? this.progress,
      isCompleted: isCompleted ?? this.isCompleted,
      error: error ?? this.error,
    );
  }
}

class FirebaseSyncService {
  final FirebaseFirestore _firestore;
  final Logger _logger = Logger();

  FirebaseSyncService({required FirebaseFirestore firestore})
    : _firestore = firestore;

  Future<void> syncAllData({
    required Function(SyncProgress) onProgress,
    bool clearExisting = false,
  }) async {
    try {
      onProgress(SyncProgress(message: 'Sync başlatılıyor...', progress: 0.0));

      // Clear existing data if requested
      if (clearExisting) {
        onProgress(
          SyncProgress(
            message: 'Mevcut veriler temizleniyor...',
            progress: 0.1,
          ),
        );
        await _clearAllData();
      }

      // Total steps: categories, cards, decks, sections
      final totalSteps = 4;
      var currentStep = 0;

      // Sync Categories
      onProgress(
        SyncProgress(
          message: 'Kategoriler yükleniyor...',
          progress: (++currentStep / totalSteps) * 0.8,
        ),
      );
      await _syncCategories();

      // Sync Cards
      onProgress(
        SyncProgress(
          message: 'Kartlar yükleniyor...',
          progress: (++currentStep / totalSteps) * 0.8,
        ),
      );
      await _syncCards();

      // Sync Decks
      onProgress(
        SyncProgress(
          message: 'Desteler yükleniyor...',
          progress: (++currentStep / totalSteps) * 0.8,
        ),
      );
      await _syncDecks();

      // Sync Sections
      onProgress(
        SyncProgress(
          message: 'Bölümler yükleniyor...',
          progress: (++currentStep / totalSteps) * 0.8,
        ),
      );
      await _syncSections();

      onProgress(
        SyncProgress(
          message: 'Sync tamamlandı!',
          progress: 1.0,
          isCompleted: true,
        ),
      );

      _logger.i('Firebase sync completed successfully');
    } catch (e, stackTrace) {
      _logger.e('Firebase sync failed', error: e, stackTrace: stackTrace);
      onProgress(
        SyncProgress(
          message: 'Sync başarısız oldu',
          progress: 0.0,
          error: e.toString(),
        ),
      );
      rethrow;
    }
  }

  Future<void> _clearAllData() async {
    final collections = ['categories', 'cards', 'decks', 'sections'];

    for (final collection in collections) {
      final snapshot = await _firestore.collection(collection).get();
      final batch = _firestore.batch();

      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
      _logger.i('Cleared collection: $collection');
    }
  }

  Future<void> _syncCategories() async {
    final batch = _firestore.batch();

    for (final category in SampleData.categories) {
      final docRef = _firestore.collection('categories').doc(category.id);
      batch.set(docRef, category.toJson());
    }

    await batch.commit();
    _logger.i('Synced ${SampleData.categories.length} categories');
  }

  Future<void> _syncCards() async {
    final batch = _firestore.batch();

    for (final card in SampleData.allCards) {
      final docRef = _firestore.collection('cards').doc(card.id);
      batch.set(docRef, card.toJson());
    }

    await batch.commit();
    _logger.i('Synced ${SampleData.allCards.length} cards');
  }

  Future<void> _syncDecks() async {
    final batch = _firestore.batch();

    for (final deck in SampleData.decks) {
      final docRef = _firestore.collection('decks').doc(deck.id);
      batch.set(docRef, deck.toJson());
    }

    await batch.commit();
    _logger.i('Synced ${SampleData.decks.length} decks');
  }

  Future<void> _syncSections() async {
    final batch = _firestore.batch();

    for (final section in SampleData.sections) {
      final docRef = _firestore.collection('sections').doc(section.id);
      batch.set(docRef, section.toJson());
    }

    await batch.commit();
    _logger.i('Synced ${SampleData.sections.length} sections');
  }

  // Helper method to check if data exists
  Future<bool> hasExistingData() async {
    final categories = await _firestore.collection('categories').limit(1).get();
    return categories.docs.isNotEmpty;
  }

  // Get collection counts
  Future<Map<String, int>> getCollectionCounts() async {
    final counts = <String, int>{};

    final collections = ['categories', 'cards', 'decks', 'sections'];
    for (final collection in collections) {
      final snapshot = await _firestore.collection(collection).get();
      counts[collection] = snapshot.docs.length;
    }

    return counts;
  }
}
