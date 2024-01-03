import 'package:flutter/material.dart';
import 'package:nost/color_schemes.g.dart';
import 'package:nost/core/extension/context_ext.dart';
import 'package:nost/core/res/typography.dart';

ThemeData getLightTheme(BuildContext context) {
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: lightColorScheme,
  );
  return base.copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent.withOpacity(0),
    ),
    textTheme: getTypography(context),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: context.colorScheme.secondary,
    ),
  );
}

ThemeData getDarkTheme(BuildContext context) {
  final base = ThemeData(
    useMaterial3: true,
    colorScheme: darkColorScheme,
  );
  return base.copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent.withOpacity(1),
    ),
    textTheme: getTypography(context),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: context.colorScheme.secondary,
    ),
  );
}
