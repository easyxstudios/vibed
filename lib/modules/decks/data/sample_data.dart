import 'package:vibed/modules/decks/api/entities/card_entity.dart';
import 'package:vibed/modules/decks/api/entities/category_entity.dart';
import 'package:vibed/modules/decks/api/entities/deck_entity.dart';
import 'package:vibed/modules/decks/api/entities/section_entity.dart';

class SampleData {
  // Categories
  static List<CategoryEntity> get categories => [
    CategoryEntity(
      id: 'dating',
      key: 'dating',
      name: {'tr': 'Tanışma', 'en': 'Dating'},
      description: {
        'tr': 'Yeni tanışan çiftler için sorular',
        'en': 'Questions for new couples',
      },
      color: '#FF6B9D',
      icon: 'favorite',
      sortOrder: 1,
      active: true,
      creationDate: DateTime.now(),
      lastUpdateDate: DateTime.now(),
    ),
    CategoryEntity(
      id: 'party',
      key: 'party',
      name: {'tr': 'Parti', 'en': 'Party'},
      description: {
        'tr': 'Arkadaş grupları için eğlenceli oyunlar',
        'en': 'Fun games for friend groups',
      },
      color: '#FFB74D',
      icon: 'celebration',
      sortOrder: 2,
      active: true,
      creationDate: DateTime.now(),
      lastUpdateDate: DateTime.now(),
    ),
    CategoryEntity(
      id: 'adult',
      key: 'adult',
      name: {'tr': 'Erotik', 'en': 'Adult'},
      description: {
        'tr': 'Yetişkinler için samimi sorular',
        'en': 'Intimate questions for adults',
      },
      color: '#E57373',
      icon: 'local_fire_department',
      sortOrder: 3,
      active: true,
      creationDate: DateTime.now(),
      lastUpdateDate: DateTime.now(),
    ),
  ];

  // Section definitions for each category
  static final Map<String, List<Map<String, dynamic>>> _sectionTemplates = {
    'dating': [
      {
        'id': 'dating_popular',
        'title': 'Popüler Tanışma',
        'subtitle': 'En çok oynanan desteler',
        'isFeatured': true,
      },
      {
        'id': 'dating_deep',
        'title': 'Derin Bağlantı',
        'subtitle': 'Birbirinizi daha iyi tanıyın',
        'isFeatured': false,
      },
      {
        'id': 'dating_first',
        'title': 'İlk Buluşma',
        'subtitle': 'Yeni tanışan çiftler için',
        'isFeatured': true,
      },
    ],
    'party': [
      {
        'id': 'party_group',
        'title': 'Grup Eğlencesi',
        'subtitle': 'Arkadaş grupları için',
        'isFeatured': true,
      },
      {
        'id': 'party_icebreaker',
        'title': 'Buzları Kır',
        'subtitle': 'Tanışma oyunları',
        'isFeatured': false,
      },
      {
        'id': 'party_drinking',
        'title': 'İçki Oyunları',
        'subtitle': 'Yetişkinler için parti oyunları',
        'isFeatured': true,
      },
    ],
    'adult': [
      {
        'id': 'adult_intimate',
        'title': 'Samimi Anlar',
        'subtitle': 'Yakın ilişkiler için',
        'isFeatured': true,
      },
      {
        'id': 'adult_fantasy',
        'title': 'Fanteziler',
        'subtitle': 'Hayal gücünüzü konuşturun',
        'isFeatured': false,
      },
      {
        'id': 'adult_relationship',
        'title': 'İlişki Derinliği',
        'subtitle': 'Uzun süreli çiftler için',
        'isFeatured': true,
      },
    ],
  };

  // Deck templates for each section
  static final Map<String, List<String>> _deckTitles = {
    'dating_popular': [
      'İlk İzlenimler',
      'Çocukluk Hikayeleri',
      'Gelecek Hayalleri',
      'Hobiler ve İlgi Alanları',
      'Aile ve Arkadaşlar',
    ],
    'dating_deep': [
      'Değerler ve İnançlar',
      'Aşk Dilleri',
      'Korkular ve Endişeler',
      'Hayat Felsefeleri',
      'Geçmiş Deneyimler',
    ],
    'dating_first': [
      'Tanışma Soruları',
      'Hafif Konular',
      'Ortak Noktalar',
      'Eğlenceli Sorular',
      'Kişilik Testi',
    ],
    'party_group': [
      'Kim Daha Çok',
      'Hiç Yapmadım',
      'Tahmin Et',
      'Rol Yapma',
      'Rekabet Oyunları',
    ],
    'party_icebreaker': [
      'İlk Tanışma',
      'Komik Sorular',
      'Ters Köşe',
      'Yaratıcı Sorular',
      'Grup Dinamiği',
    ],
    'party_drinking': [
      'İçki Oyunu Klasikleri',
      'Truth or Dare',
      'Ceza Oyunları',
      'Kupa Oyunları',
      'Alkol Trivia',
    ],
    'adult_intimate': [
      'Samimi İtiraflar',
      'Duygusal Bağlantı',
      'Fiziksel Yakınlık',
      'İlişki Dinamikleri',
      'Çift Terapisi',
    ],
    'adult_fantasy': [
      'Gizli Arzular',
      'Rol Fantezileri',
      'Yatak Odası Sırları',
      'Deneyim Paylaşımı',
      'Hayal Dünyası',
    ],
    'adult_relationship': [
      'İlişki Tarihi',
      'Çatışma Çözümü',
      'Gelecek Planları',
      'Cinsellik',
      'Bağlılık',
    ],
  };

  // Card content templates for different themes
  static final Map<String, List<String>> _cardContents = {
    'dating_questions': [
      'Beni ilk gördüğünde ne düşündün?',
      'En sevdiğin çocukluk oyunu neydi?',
      '5 yıl sonra kendini nerede görüyorsun?',
      'En büyük hayalin nedir?',
      'Hangi konuda saatlerce konuşabilirsin?',
      'En çok hangi konuda meraklısın?',
      'İdeal bir hafta sonu nasıl geçer?',
      'En sevdiğin kitap/film hangisi?',
      'Hangi yeteneğe sahip olmak isterdin?',
      'En unutulmaz anın nedir?',
    ],
    'party_questions': [
      'Hayatındaki en utanç verici anını anlat',
      'Ünlü olsaydın hangi dalda ünlü olurdun?',
      'Kimsenin bilmediği gizli yeteneğin var mı?',
      'En komik korkun nedir?',
      'Çocukken hangi mesleği hayal ediyordun?',
      'En garip alışkanlığın nedir?',
      'Süper gücün olsaydı ne olmasını isterdin?',
      'En sevmediğin yemek nedir?',
      'Hangi ünlüyle tanışmak istersin?',
      'En büyük pişmanlığın nedir?',
    ],
    'adult_questions': [
      'En büyük fantezin nedir?',
      'İlk romantik deneyimini hatırlıyor musun?',
      'Sevgiyi nasıl ifade edersin?',
      'İlişkide en önemli şey nedir?',
      'Hangi konularda sınırların var?',
      'En romantik anın nedir?',
      'İdeal bir akşam nasıl geçer?',
      'Hangi durumlarda kendin gibi hissedersin?',
      'En büyük korkun nedir?',
      'Gelecekten ne bekliyorsun?',
    ],
  };

  // Generate all cards dynamically
  static List<CardEntity> get allCards {
    final cards = <CardEntity>[];
    var cardIndex = 1;

    for (final category in categories) {
      final sections = _sectionTemplates[category.id] ?? [];

      for (final sectionTemplate in sections) {
        final deckTitles = _deckTitles[sectionTemplate['id'] as String] ?? [];

        for (var deckIndex = 0; deckIndex < deckTitles.length; deckIndex++) {
          // Get appropriate content based on category
          List<String> contentPool;
          if (category.id == 'dating') {
            contentPool = _cardContents['dating_questions']!;
          } else if (category.id == 'party') {
            contentPool = _cardContents['party_questions']!;
          } else {
            contentPool = _cardContents['adult_questions']!;
          }

          // Generate 10 cards per deck
          for (var cardIdx = 0; cardIdx < 10; cardIdx++) {
            final contentIndex =
                (deckIndex * 10 + cardIdx) % contentPool.length;
            final isPremium =
                category.id == 'adult' ||
                (deckIndex >= 2); // Adult cards are premium, some others too

            cards.add(
              CardEntity(
                id: 'card_${category.id}_${sectionTemplate['id']}_deck${deckIndex}_${cardIdx}',
                title: '${deckTitles[deckIndex]} ${cardIdx + 1}',
                content: contentPool[contentIndex],
                categoryId: category.id!,
                difficultyLevel: (cardIdx % 3) + 1, // 1-3 difficulty
                tags: [
                  category.id!,
                  sectionTemplate['id'] as String,
                  'deck$deckIndex',
                ],
                isPremium: isPremium,
                creationDate: DateTime.now(),
                lastUpdateDate: DateTime.now(),
              ),
            );
          }
        }
      }
    }

    return cards;
  }

  // Generate all decks dynamically
  static List<DeckEntity> get decks {
    final decksList = <DeckEntity>[];
    var imageIndex = 1;

    for (final category in categories) {
      final sections = _sectionTemplates[category.id] ?? [];

      for (final sectionTemplate in sections) {
        final deckTitles = _deckTitles[sectionTemplate['id'] as String] ?? [];

        for (var deckIndex = 0; deckIndex < deckTitles.length; deckIndex++) {
          final deckId =
              'deck_${category.id}_${sectionTemplate['id']}_$deckIndex';

          // Get card IDs for this deck
          final cardIds = <String>[];
          for (var cardIdx = 0; cardIdx < 10; cardIdx++) {
            cardIds.add(
              'card_${category.id}_${sectionTemplate['id']}_deck${deckIndex}_$cardIdx',
            );
          }

          final isPremium = category.id == 'adult' || (deckIndex >= 2);
          final isLocked = isPremium;

          // Map category to DeckCategory enum
          DeckCategory deckCategory;
          switch (category.id) {
            case 'dating':
              deckCategory = DeckCategory.relationship;
              break;
            case 'party':
              deckCategory = DeckCategory.party;
              break;
            case 'adult':
              deckCategory = DeckCategory.adult;
              break;
            default:
              deckCategory = DeckCategory.popular;
          }

          decksList.add(
            DeckEntity(
              id: deckId,
              title: deckTitles[deckIndex],
              subtitle: '10 soruluk ${category.name['tr']} destesi',
              imageUrl: 'https://picsum.photos/144/144?random=$imageIndex',
              fireCount: (deckIndex % 3) + 1, // 1-3 fires
              isLocked: isLocked,
              unlockText: isLocked ? 'Premium Al' : 'Oyna',
              categoryId: category.id!,
              cardIds: cardIds,
              category: deckCategory,
              isPremium: isPremium,
              sortOrder: deckIndex + 1,
              active: true,
              creationDate: DateTime.now(),
              lastUpdateDate: DateTime.now(),
            ),
          );

          imageIndex++;
        }
      }
    }

    return decksList;
  }

  // Generate all sections dynamically
  static List<SectionEntity> get sections {
    final sectionsList = <SectionEntity>[];
    var sectionOrder = 1;

    for (final category in categories) {
      final sectionTemplates = _sectionTemplates[category.id] ?? [];

      for (
        var sectionIndex = 0;
        sectionIndex < sectionTemplates.length;
        sectionIndex++
      ) {
        final template = sectionTemplates[sectionIndex];

        // Get deck IDs for this section
        final deckIds = <String>[];
        final deckTitles = _deckTitles[template['id'] as String] ?? [];

        for (var deckIndex = 0; deckIndex < deckTitles.length; deckIndex++) {
          deckIds.add('deck_${category.id}_${template['id']}_$deckIndex');
        }

        sectionsList.add(
          SectionEntity(
            id: template['id'] as String?,
            title: template['title'] as String,
            subtitle: template['subtitle'] as String,
            categoryId: category.id!,
            deckIds: deckIds,
            sortOrder: sectionOrder++,
            isFeatured: template['isFeatured'] as bool? ?? false,
            active: true,
            creationDate: DateTime.now(),
            lastUpdateDate: DateTime.now(),
          ),
        );
      }
    }

    return sectionsList;
  }

  // Helper methods to get specific category data
  static List<CardEntity> getCardsForCategory(String categoryId) {
    return allCards.where((card) => card.categoryId == categoryId).toList();
  }

  static List<DeckEntity> getDecksForCategory(String categoryId) {
    return decks.where((deck) => deck.categoryId == categoryId).toList();
  }

  static List<SectionEntity> getSectionsForCategory(String categoryId) {
    return sections
        .where((section) => section.categoryId == categoryId)
        .toList();
  }

  // Statistics
  static Map<String, int> get statistics {
    return {
      'categories': categories.length,
      'sections': sections.length,
      'decks': decks.length,
      'cards': allCards.length,
      'premium_decks': decks.where((d) => d.isPremium).length,
      'premium_cards': allCards.where((c) => c.isPremium).length,
    };
  }
}
