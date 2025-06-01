import 'package:bart/bart.dart';
import 'package:bart/bart/widgets/bottom_bar/styles/bottom_bar_custom.dart';
import 'package:flutter/material.dart';
import 'package:vibed/core/theme/extensions/theme_extension.dart';

// Bottom bar constants
const double _kBottomBarHeight = 56.0;
const double _kBottomBarItemWidth = 80.0;
const double _kBottomBarBorderRadius = 82.0;
const double _kBottomBarItemBorderRadius = 100.0;
const double _kBottomBarHorizontalMargin = 21.0;
const double _kBottomBarBottomMargin = 30.0;
const double _kBottomBarPadding = 8.0;
const double _kIconSize = 24.0;
const double _kShadowBlurRadius = 25.0;
const double _kShadowOffset = 10.0;
const double _kItemShadowBlurRadius = 8.0;
const double _kItemShadowOffset = 2.0;
const double _kBorderWidth = 1.0;
const Duration _kAnimationDuration = Duration(milliseconds: 200);

// Color opacity constants
const double _kBackgroundOpacity = 1;
const double _kInactiveIconOpacity = 0.2;
const double _kShadowOpacity = 0.3;
const double _kBorderOpacity = 0.1;
const double _kActiveShadowOpacity = 0.3;

class VibedBottomBar implements BartBottomBarFactory {
  const VibedBottomBar();

  @override
  Widget create({
    required BuildContext context,
    required List<BartMenuRoute> routes,
    required void Function(int) onTap,
    required int currentIndex,
  }) {
    // Filter routes that should show in bottom bar (bottomBar type routes only, not innerRoute)
    final visibleRoutes = routes
        .where((route) => route.type == BartMenuRouteType.bottomNavigation)
        .toList();

    return Container(
      margin: const EdgeInsets.only(
        left: _kBottomBarHorizontalMargin,
        right: _kBottomBarHorizontalMargin,
        bottom: _kBottomBarBottomMargin,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: _kBottomBarPadding,
        vertical: _kBottomBarPadding,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff1A1A1A).withOpacity(_kBackgroundOpacity),
        borderRadius: BorderRadius.circular(_kBottomBarBorderRadius),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: visibleRoutes.asMap().entries.map((entry) {
          final index = entry.key;
          final route = entry.value;

          return _buildBottomBarItem(
            context: context,
            route: route,
            index: index,
            isActive: currentIndex == index,
            onTap: () => onTap(index),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBottomBarItem({
    required BuildContext context,
    required BartMenuRoute route,
    required int index,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return AnimatedContainer(
      duration: _kAnimationDuration,
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: _kBottomBarItemWidth,
          height: _kBottomBarHeight,
          decoration: BoxDecoration(
            color: isActive
                ? context.colors.bottomBarActive
                : Colors.transparent,
            borderRadius: BorderRadius.circular(_kBottomBarItemBorderRadius),
          ),
          child: Center(
            child: Icon(
              route.icon ?? Icons.notifications,
              size: _kIconSize,
              color: isActive
                  ? context.colors.bottomBarOnActive
                  : Colors.white.withOpacity(_kInactiveIconOpacity),
            ),
          ),
        ),
      ),
    );
  }
}
