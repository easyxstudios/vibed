import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vibed/core/theme/extensions/theme_extension.dart';
import 'package:vibed/modules/decks/api/entities/deck_entity.dart';
import 'package:vibed/modules/decks/domain/deck.dart';
import 'package:vibed/modules/decks/providers/firestore_providers.dart';
import 'package:vibed/modules/decks/ui/widgets/deck_card.dart';

/// this homepage is for demo purpose only
/// You can delete it and start from scratch
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return Scaffold(
      backgroundColor: context.colors.onBackground,
      body: CustomScrollView(
        slivers: [_buildSliverAppBar(), _buildSliverContent(selectedCategory)],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      floating: true,
      pinned: true,
      snap: false,
      backgroundColor: Colors.black.withValues(alpha: .5),
      surfaceTintColor: Colors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'VIBED',
            style: context.textTheme.headlineLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.diamond, color: Colors.orange, size: 16),
                SizedBox(width: 4),
                Text(
                  'Premium',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      expandedHeight: 100, // Ana başlık + kategoriler için yeterli alan
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: const EdgeInsets.only(top: 120),
          color: context.colors.onBackground,
          child: _buildCategoryTabsInFlexibleSpace(),
        ),
      ),
    );
  }

  Widget _buildCategoryTabsInFlexibleSpace() {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final categoriesAsync = ref.watch(categoriesProvider);

    return categoriesAsync.when(
      data: (categories) {
        final tabCategories = ['Tümü', ...categories.map((c) => c.name['tr']!)];

        return Container(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: tabCategories.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final category = tabCategories[index];
              final isSelected =
                  (index == 0 && selectedCategory == null) ||
                  (index > 0 && selectedCategory == categories[index - 1].id);

              return GestureDetector(
                onTap: () {
                  ref.read(selectedCategoryProvider.notifier).state = index == 0
                      ? null
                      : categories[index - 1].id;
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF99DE43) // Figma'daki yeşil
                        : Colors.white.withValues(
                            alpha: 0.1,
                          ), // Semi-transparent white
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Padding(
                    padding: index == 0
                        ? const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ) // Tümü için
                        : const EdgeInsets.fromLTRB(
                            12,
                            8,
                            16,
                            8,
                          ), // İkonlu kategoriler için
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (index > 0) ...[
                          Icon(
                            _getCategoryIcon(categories[index - 1].icon),
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                        ],
                        Text(
                          category,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: isSelected
                                ? Colors
                                      .black // Seçili durumda siyah
                                : Colors.white, // Seçili değilse beyaz
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
      loading: () => const SizedBox(
        height: 56,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => const SizedBox(
        height: 56,
        child: Center(
          child: Text(
            'Kategoriler yüklenemedi',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _buildSliverContent(String? selectedCategory) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),

            // Featured Large Card
            _buildFeaturedSection(selectedCategory),
            const SizedBox(height: 32),

            // Sections
            _buildSectionsContent(selectedCategory),

            const SizedBox(height: 100), // Bottom padding for navigation
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedSection(String? selectedCategory) {
    final featuredDeckAsync = ref.watch(featuredDeckProvider(selectedCategory));

    return featuredDeckAsync.when(
      data: (deckEntity) {
        if (deckEntity == null) return const SizedBox.shrink();
        return _buildFeaturedCard(deckEntity);
      },
      loading: () => Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, stack) => Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Center(
          child: Text(
            'Öne çıkan kart yüklenemedi',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionsContent(String? selectedCategory) {
    final sectionsAsync = ref.watch(
      sectionsByCategoryProvider(selectedCategory),
    );

    return sectionsAsync.when(
      data: (sections) {
        return Column(
          children: sections.map((section) {
            final decksByIdsAsync = ref.watch(
              decksByIdsProvider(section.deckIds),
            );

            return decksByIdsAsync.when(
              data: (deckEntities) =>
                  _buildSection(section.title, section.subtitle, deckEntities),
              loading: () =>
                  _buildLoadingSection(section.title, section.subtitle),
              error: (error, stack) =>
                  _buildErrorSection(section.title, section.subtitle),
            );
          }).toList(),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => const Center(
        child: Text(
          'Bölümler yüklenemedi',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget _buildFeaturedCard(DeckEntity deckEntity) {
    final deck = Deck.fromEntity(deckEntity as DeckEntity);

    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(deck.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Fire badge
          Positioned(
            top: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFE44513),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  deck.fireCount,
                  (index) => Padding(
                    padding: EdgeInsets.only(
                      right: index < deck.fireCount - 1 ? 2 : 0,
                    ),
                    child: const Icon(
                      Icons.local_fire_department,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Play button
          if (!deck.isLocked)
            Positioned(
              bottom: 12,
              right: 12,
              child: Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Color(0xFF8BC34A),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),

          // Title section
          Positioned(
            bottom: 12,
            left: 12,
            right: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deck.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  deckEntity.categoryId.toString().toUpperCase(),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    String title,
    String subtitle,
    List<DeckEntity> deckEntities,
  ) {
    if (deckEntities.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 190,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: deckEntities.length,
            separatorBuilder: (context, index) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final deckEntity = deckEntities[index];
              final deck = Deck.fromEntity(deckEntity as DeckEntity);
              return DeckCard(
                deck: deck,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Tapped on "${deck.title}"'),
                      backgroundColor: context.colors.primary,
                    ),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildLoadingSection(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const SizedBox(
          height: 190,
          child: Center(child: CircularProgressIndicator()),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildErrorSection(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        const SizedBox(
          height: 190,
          child: Center(
            child: Text(
              'Veriler yüklenemedi',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  IconData _getCategoryIcon(String iconName) {
    switch (iconName) {
      case 'favorite':
        return Icons.favorite;
      case 'celebration':
        return Icons.celebration;
      case 'local_fire_department':
        return Icons.local_fire_department;
      default:
        return Icons.category;
    }
  }
}

/// Here is just a simple content card
class HomeCard extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String description;
  final Color? textColor;
  final Color? backgroundColor;

  const HomeCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.description,
    this.textColor,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        SystemSound.play(SystemSoundType.click);
        HapticFeedback.mediumImpact();
        onTap.call();
      },
      child: Card(
        color: backgroundColor ?? context.colors.primary.withValues(alpha: .15),
        margin: EdgeInsets.zero,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8,
            children: [
              Text(
                title,
                style: context.textTheme.headlineSmall?.copyWith(
                  color: textColor ?? context.colors.onSurface,
                ),
              ),
              Text(
                description,
                style: context.textTheme.bodyMedium?.copyWith(
                  color:
                      textColor ??
                      context.colors.onSurface.withValues(alpha: .6),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Home Page State Provider
final selectedCategoryProvider = StateProvider<String?>((ref) => null);
