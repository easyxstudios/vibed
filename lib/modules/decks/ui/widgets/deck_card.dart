import 'package:flutter/material.dart';
import 'package:vibed/core/theme/extensions/theme_extension.dart';
import 'package:vibed/modules/decks/domain/deck.dart';

// DeckCard constants
const double _kCardWidth = 144.0;
const double _kCardHeight = 184.0;
const double _kImageHeight = 144.0;
const double _kCardBorderRadius = 20.0;
const double _kPlayButtonBorderRadius = 42.0;
const double _kFireBadgeBorderRadius = 24.0;
const double _kGap = 8.0;
const double _kFireBadgePadding = 6.0;
const double _kFireBadgeHorizontalPadding = 8.0;
const double _kPlayButtonPadding = 8.0;
const double _kPlayButtonGap = 4.0;
const double _kFireIconSize = 12.0;
const double _kPlayIconSize = 16.0;

// Text styles constants
const double _kTitleFontSize = 12.0;
const double _kSubtitleFontSize = 11.0;
const FontWeight _kTitleFontWeight = FontWeight.w600;
const FontWeight _kSubtitleFontWeight = FontWeight.w400;
const FontWeight _kUnlockButtonFontWeight = FontWeight.w500;
const double _kUnlockButtonFontSize = 10.0;

class DeckCard extends StatelessWidget {
  final Deck deck;
  final VoidCallback? onTap;
  final VoidCallback? onUnlock;

  const DeckCard({super.key, required this.deck, this.onTap, this.onUnlock});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: _kCardWidth,
        height: _kCardHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImageSection(context),
            const SizedBox(height: _kGap),
            _buildTextSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(BuildContext context) {
    return SizedBox(
      width: _kCardWidth,
      height: _kImageHeight,
      child: Stack(
        children: [
          _buildBackgroundImage(),
          _buildFireBadge(context),
          if (deck.isLocked) _buildUnlockButton(context),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      width: _kCardWidth,
      height: _kImageHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_kCardBorderRadius),
        image: DecorationImage(
          image: NetworkImage(deck.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildFireBadge(BuildContext context) {
    return Positioned(
      top: _kGap,
      left: _kGap,
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.deckCardFireBadge,
          borderRadius: BorderRadius.circular(_kFireBadgeBorderRadius),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: _kFireBadgePadding,
          horizontal: _kFireBadgeHorizontalPadding,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            deck.fireCount,
            (index) => Padding(
              padding: EdgeInsets.only(
                right: index < deck.fireCount - 1 ? _kPlayButtonGap : 0,
              ),
              child: Icon(
                Icons.local_fire_department,
                size: _kFireIconSize,
                color: index < deck.fireCount - 1
                    ? Colors.white
                    : Colors.white.withOpacity(0.2),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUnlockButton(BuildContext context) {
    return Positioned(
      bottom: _kGap * 2,
      left: 0,
      right: 0,
      child: Center(
        child: GestureDetector(
          onTap: onUnlock,
          child: Container(
            decoration: BoxDecoration(
              color: context.colors.deckCardUnlockButton,
              borderRadius: BorderRadius.circular(_kPlayButtonBorderRadius),
              border: Border.all(
                color: Colors.white.withOpacity(0.05),
                width: 1,
              ),
            ),
            padding: const EdgeInsets.all(_kPlayButtonPadding),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.play_arrow,
                  size: _kPlayIconSize,
                  color: Colors.white,
                ),
                const SizedBox(width: _kPlayButtonGap),
                Text(
                  deck.unlockText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: _kUnlockButtonFontSize,
                    fontWeight: _kUnlockButtonFontWeight,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextSection(BuildContext context) {
    return SizedBox(
      width: _kCardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            deck.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: _kTitleFontSize,
              fontWeight: _kTitleFontWeight,
              fontFamily: 'Inter',
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: _kPlayButtonGap),
          Text(
            deck.subtitle,
            style: TextStyle(
              color: context.colors.deckCardSubtitle,
              fontSize: _kSubtitleFontSize,
              fontWeight: _kSubtitleFontWeight,
              fontFamily: 'Inter',
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
