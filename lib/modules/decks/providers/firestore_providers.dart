import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibed/modules/decks/api/entities/category_entity.dart';
import 'package:vibed/modules/decks/api/entities/deck_entity.dart';
import 'package:vibed/modules/decks/api/entities/section_entity.dart';
import 'package:vibed/modules/decks/api/firestore_repository.dart';

// Provider for all categories
final categoriesProvider = FutureProvider<List<CategoryEntity>>((ref) async {
  final repository = ref.watch(firestoreRepositoryProvider);
  return repository.getCategories();
});

// Provider for all sections
final sectionsProvider = FutureProvider<List<SectionEntity>>((ref) async {
  final repository = ref.watch(firestoreRepositoryProvider);
  return repository.getSections();
});

// Provider for sections filtered by category
final sectionsByCategoryProvider =
    FutureProvider.family<List<SectionEntity>, String?>((
      ref,
      categoryId,
    ) async {
      final repository = ref.watch(firestoreRepositoryProvider);
      if (categoryId == null) {
        return repository.getSections();
      }
      return repository.getSectionsByCategory(categoryId);
    });

// Provider for all decks
final decksProvider = FutureProvider<List<DeckEntity>>((ref) async {
  final repository = ref.watch(firestoreRepositoryProvider);
  return repository.getDecks();
});

// Provider for decks filtered by category
final decksByCategoryProvider =
    FutureProvider.family<List<DeckEntity>, String?>((ref, categoryId) async {
      final repository = ref.watch(firestoreRepositoryProvider);
      if (categoryId == null) {
        return repository.getDecks();
      }
      return repository.getDecksByCategory(categoryId);
    });

// Provider for decks by specific IDs
final decksByIdsProvider =
    FutureProvider.family<List<DeckEntity>, List<String>>((ref, deckIds) async {
      final repository = ref.watch(firestoreRepositoryProvider);
      return repository.getDecksByIds(deckIds);
    });

// Provider for featured deck
final featuredDeckProvider = FutureProvider.family<DeckEntity?, String?>((
  ref,
  categoryId,
) async {
  final repository = ref.watch(firestoreRepositoryProvider);
  return repository.getFeaturedDeck(categoryId: categoryId);
});

// State provider for selected category (keeping this for UI state)
final selectedCategoryProvider = StateProvider<String?>((ref) => null);
