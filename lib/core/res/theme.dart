import 'package:flutter/material.dart';
import 'package:nost/color_schemes.g.dart';
import 'package:nost/core/res/typography.dart';

ThemeData getLightTheme(BuildContext context) {
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
  );
  return base.copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
    ),
    textTheme: getTypography(context),
  );
}

ThemeData getDarkTheme(BuildContext context) {
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
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
