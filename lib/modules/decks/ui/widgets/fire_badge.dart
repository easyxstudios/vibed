import 'package:flutter/material.dart';
import 'package:vibed/core/theme/extensions/theme_extension.dart';

// FireBadge constants
const double _kFireBadgeBorderRadius = 24.0;
const double _kFireBadgePadding = 6.0;
const double _kFireBadgeHorizontalPadding = 8.0;
const double _kFireIconSize = 12.0;
const double _kFireIconSpacing = 4.0;
const int _kMaxFireCount = 3;

class FireBadge extends StatelessWidget {
  final int totalFireCount;
  final int activeFireCount;

  const FireBadge({
    super.key,
    required this.totalFireCount,
    required this.activeFireCount,
  }) : assert(totalFireCount <= _kMaxFireCount && totalFireCount >= 0),
       assert(activeFireCount >= 0 && activeFireCount <= totalFireCount);

  @override
  Widget build(BuildContext context) {
    if (totalFireCount == 0) {
      return const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        color: context.colors.deckCardFireBadge,
        borderRadius: BorderRadius.circular(_kFireBadgeBorderRadius),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: _kFireBadgePadding,
        horizontal: _kFireBadgeHorizontalPadding,
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: _buildFireIcons()),
    );
  }

  List<Widget> _buildFireIcons() {
    final List<Widget> fireIcons = [];

    for (int index = 0; index < totalFireCount; index++) {
      final bool isActive = index < activeFireCount;

      fireIcons.add(
        _buildFireIcon(isActive: isActive, isLast: index == totalFireCount - 1),
      );
    }

    return fireIcons;
  }

  Widget _buildFireIcon({required bool isActive, required bool isLast}) {
    return Padding(
      padding: EdgeInsets.only(right: isLast ? 0 : _kFireIconSpacing),
      child: Icon(
        Icons.local_fire_department,
        size: _kFireIconSize,
        color: isActive ? Colors.white : Colors.white.withOpacity(0.2),
      ),
    );
  }
}
