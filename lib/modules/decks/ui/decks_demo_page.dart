import 'package:flutter/material.dart';
import 'package:vibed/modules/decks/api/entities/deck_entity.dart';
import 'package:vibed/modules/decks/domain/deck.dart';
import 'package:vibed/modules/decks/ui/widgets/deck_card.dart';

class DecksDemoPage extends StatelessWidget {
  const DecksDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Deck Cards Demo'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Wrap(spacing: 16, runSpacing: 16, children: _buildSampleDecks()),
      ),
    );
  }

  List<Widget> _buildSampleDecks() {
    final sampleDecks = [
      Deck(
        id: '1',
        title: 'Popüler Oyunlar',
        subtitle: 'Yeni Tanışan Çiftler İçin',
        imageUrl: 'https://picsum.photos/144/144?random=1',
        fireCount: 3,
        isLocked: true,
        unlockText: 'Kilidi Aç',
        category: DeckCategory.popular,
        creationDate: DateTime.now(),
      ),
      Deck(
        id: '2',
        title: 'Romantik Sorular',
        subtitle: 'Aşık Çiftler İçin',
        imageUrl: 'https://picsum.photos/144/144?random=2',
        fireCount: 2,
        isLocked: false,
        unlockText: 'Oyna',
        category: DeckCategory.relationship,
        creationDate: DateTime.now(),
      ),
      Deck(
        id: '3',
        title: 'Party Oyunları',
        subtitle: 'Arkadaş Grupları İçin',
        imageUrl: 'https://picsum.photos/144/144?random=3',
        fireCount: 1,
        isLocked: true,
        unlockText: 'Premium Al',
        category: DeckCategory.party,
        creationDate: DateTime.now(),
      ),
      Deck(
        id: '4',
        title: 'Derinlemesine',
        subtitle: 'Uzun Süreli İlişkiler',
        imageUrl: 'https://picsum.photos/144/144?random=4',
        fireCount: 3,
        isLocked: false,
        unlockText: 'Başla',
        category: DeckCategory.adult,
        creationDate: DateTime.now(),
      ),
    ];

    return sampleDecks
        .map(
          (deck) => DeckCard(
            deck: deck,
            onTap: () {
              debugPrint('Deck tapped: ${deck.title}');
            },
            onUnlock: deck.isLocked
                ? () {
                    debugPrint('Unlock tapped for: ${deck.title}');
                  }
                : null,
          ),
        )
        .toList();
  }
}
