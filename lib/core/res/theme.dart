import 'package:flutter/material.dart';
import 'package:nost/core/res/typography.dart';

ThemeData getLightTheme(BuildContext context, ColorScheme colorScheme) {
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
  );
  return base.copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    textTheme: getTypography(context),
  );
}

ThemeData getDarkTheme(BuildContext context, ColorScheme colorScheme) {
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
  );
  return base.copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    textTheme: getTypography(context),
    badgeTheme: const BadgeThemeData(
      backgroundColor: Colors.red,
    ),
  );
}
