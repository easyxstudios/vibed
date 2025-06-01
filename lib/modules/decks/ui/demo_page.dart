import 'package:flutter/material.dart';
import 'package:vibed/core/theme/extensions/theme_extension.dart';
import 'package:vibed/modules/decks/data/sample_data.dart';
import 'package:vibed/modules/decks/domain/deck.dart';
import 'package:vibed/modules/decks/ui/widgets/deck_card.dart';

class DecksDemoPage extends StatelessWidget {
  const DecksDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = SampleData.statistics;

    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        title: const Text('Decks Demo'),
        backgroundColor: context.colors.surface,
        foregroundColor: context.colors.onSurface,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Statistics Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: context.colors.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Generated Data Statistics',
                    style: context.textTheme.titleLarge?.copyWith(
                      color: context.colors.onSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...stats.entries.map(
                    (entry) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            entry.key.replaceAll('_', ' ').toUpperCase(),
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colors.onSurface,
                            ),
                          ),
                          Text(
                            '${entry.value}',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Categories and their content
            ...SampleData.categories.map((category) {
              final sections = SampleData.getSectionsForCategory(category.id!);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category header
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(
                        int.parse(category.color.substring(1), radix: 16) +
                            0xFF000000,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.name['tr'] ?? 'Unknown',
                          style: context.textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          category.description['tr'] ?? '',
                          style: context.textTheme.bodyMedium?.copyWith(
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${sections.length} sections • ${SampleData.getDecksForCategory(category.id!).length} decks • ${SampleData.getCardsForCategory(category.id!).length} cards',
                          style: context.textTheme.bodySmall?.copyWith(
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Sections for this category
                  ...sections.map((section) {
                    final decks = SampleData.decks
                        .where((deck) => section.deckIds.contains(deck.id))
                        .toList();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Section header
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                section.title,
                                style: context.textTheme.titleMedium?.copyWith(
                                  color: context.colors.onBackground,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                section.subtitle,
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: context.colors.onBackground
                                      .withOpacity(0.7),
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${decks.length} decks',
                                style: context.textTheme.bodySmall?.copyWith(
                                  color: context.colors.primary,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Deck cards in horizontal scroll
                        SizedBox(
                          height: 200,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            itemCount: decks.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 12),
                            itemBuilder: (context, index) {
                              final deckEntity = decks[index];
                              // Convert DeckEntity to Deck domain object for the widget
                              final deck = Deck.fromEntity(deckEntity);
                              return DeckCard(
                                deck: deck,
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Tapped on "${deck.title}" - ${deckEntity.cardIds.length} cards',
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 24),
                      ],
                    );
                  }),

                  const SizedBox(height: 32),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
