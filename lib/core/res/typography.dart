import 'package:flutter/material.dart';
import 'package:nost/core/extension/context_ext.dart';

TextTheme getTypography(BuildContext context) => TextTheme(
      titleLarge: TextStyle(
        color: context.colorScheme.onPrimary,
        fontWeight: FontWeight.bold,
      ),
      labelLarge: TextStyle(
        color: context.colorScheme.onPrimary,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: context.colorScheme.onPrimary.withOpacity(0.8),
        fontWeight: FontWeight.bold,
      ),
    );
