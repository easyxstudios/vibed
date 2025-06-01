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
const double _kBackgroundOpacity = 0.9;
const double _kInactiveIconOpacity = 0.2;
const double _kShadowOpacity = 0.3;
const double _kBorderOpacity = 0.1;
const double _kActiveShadowOpacity = 0.3;

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
        color: Colors.black.withOpacity(_kBackgroundOpacity),
        borderRadius: BorderRadius.circular(_kBottomBarBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(_kShadowOpacity),
            blurRadius: _kShadowBlurRadius,
            offset: const Offset(0, _kShadowOffset),
          ),
        ],
        border: Border.all(
          color: Colors.white.withOpacity(_kBorderOpacity),
          width: _kBorderWidth,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBottomBarItem(
            context: context,
            index: 0,
            icon: Icons.explore,
            isActive: currentIndex == 0,
          ),
          _buildBottomBarItem(
            context: context,
            index: 1,
            icon: Icons.search,
            isActive: currentIndex == 1,
          ),
          _buildBottomBarItem(
            context: context,
            index: 2,
            icon: Icons.library_books,
            isActive: currentIndex == 2,
          ),
          _buildBottomBarItem(
            context: context,
            index: 3,
            icon: Icons.person,
            isActive: currentIndex == 3,
          ),
        ],
      ),
    );
  }

  Widget _buildBottomBarItem({
    required BuildContext context,
    required int index,
    required IconData icon,
    required bool isActive,
  }) {
    return AnimatedContainer(
      duration: _kAnimationDuration,
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: () => onTap(index),
        child: Container(
          width: _kBottomBarItemWidth,
          height: _kBottomBarHeight,
          decoration: BoxDecoration(
            color: isActive
                ? context.colors.bottomBarActive
                : Colors.transparent,
            borderRadius: BorderRadius.circular(_kBottomBarItemBorderRadius),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: context.colors.bottomBarActive.withOpacity(
                        _kActiveShadowOpacity,
                      ),
                      blurRadius: _kItemShadowBlurRadius,
                      offset: const Offset(0, _kItemShadowOffset),
                    ),
                  ]
                : null,
          ),
          child: Center(
            child: Icon(
              icon,
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
