import 'package:vibed/core/theme/colors.dart';
import 'package:flutter/material.dart';

class VibedThemeData {
  static ThemeData buildDarkTheme({
    required ApparenceKitColors colors,
    required TextTheme defaultTextStyle,
  }) {
    final colorScheme = ColorScheme.dark(
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      secondary: colors.primary,
      onSecondary: colors.onPrimary,
      surface: colors.surface,
      onSurface: colors.onSurface,
      background: colors.background,
      onBackground: colors.onBackground,
      error: colors.error,
    );

    return ThemeData(
      colorScheme: colorScheme,
      textTheme: defaultTextStyle,
      scaffoldBackgroundColor: colors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.black.withOpacity(0.9),
        indicatorColor: colors.bottomBarActive,
        iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>((
          Set<MaterialState> states,
        ) {
          if (states.contains(MaterialState.selected)) {
            return IconThemeData(color: colors.bottomBarOnActive);
          }
          return IconThemeData(color: Colors.white.withOpacity(0.2));
        }),
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>((
          Set<MaterialState> states,
        ) {
          if (states.contains(MaterialState.selected)) {
            return TextStyle(
              color: colors.bottomBarOnActive,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            );
          }
          return TextStyle(
            color: Colors.white.withOpacity(0.2),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          );
        }),
        height: 80,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black.withOpacity(0.9),
        selectedItemColor: colors.bottomBarOnActive,
        unselectedItemColor: Colors.white.withOpacity(0.2),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      extensions: [colors],
    );
  }

  static ThemeData buildLightTheme({
    required ApparenceKitColors colors,
    required TextTheme defaultTextStyle,
  }) {
    final colorScheme = ColorScheme.light(
      primary: colors.primary,
      onPrimary: colors.onPrimary,
      secondary: colors.primary,
      onSecondary: colors.onPrimary,
      surface: colors.surface,
      onSurface: colors.onSurface,
      background: colors.background,
      onBackground: colors.onBackground,
      error: colors.error,
    );

    return ThemeData(
      colorScheme: colorScheme,
      textTheme: defaultTextStyle,
      scaffoldBackgroundColor: colors.background,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surface,
        foregroundColor: colors.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: Colors.white.withOpacity(0.95),
        indicatorColor: colors.bottomBarActive,
        iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>((
          Set<MaterialState> states,
        ) {
          if (states.contains(MaterialState.selected)) {
            return IconThemeData(color: colors.bottomBarOnActive);
          }
          return IconThemeData(color: Colors.black.withOpacity(0.3));
        }),
        labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>((
          Set<MaterialState> states,
        ) {
          if (states.contains(MaterialState.selected)) {
            return TextStyle(
              color: colors.bottomBarOnActive,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            );
          }
          return TextStyle(
            color: Colors.black.withOpacity(0.3),
            fontSize: 12,
            fontWeight: FontWeight.w500,
          );
        }),
        height: 80,
        elevation: 0,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white.withOpacity(0.95),
        selectedItemColor: colors.bottomBarOnActive,
        unselectedItemColor: Colors.black.withOpacity(0.3),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),
      extensions: [colors],
    );
  }
}
