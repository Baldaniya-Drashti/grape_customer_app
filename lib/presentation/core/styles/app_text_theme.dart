import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme get light => ThemeData.light().textTheme.copyWith(
        displayLarge: const TextStyle(fontSize: 20),
        displayMedium: const TextStyle(fontSize: 26),
        displaySmall: const TextStyle(fontSize: 24),
        headlineMedium: const TextStyle(fontSize: 22),
        headlineSmall: const TextStyle(fontSize: 20),
        titleLarge: const TextStyle(fontSize: 18),
        titleMedium: const TextStyle(fontSize: 16),
        titleSmall: const TextStyle(fontSize: 14),
        bodyLarge: const TextStyle(),
        bodyMedium: const TextStyle(),
        bodySmall: const TextStyle(),
        labelLarge: const TextStyle(fontSize: 14),
        labelSmall: const TextStyle(),
      );
  static TextTheme get dark => ThemeData.dark().textTheme.copyWith(
        displayLarge: const TextStyle(fontSize: 20),
        displayMedium: const TextStyle(fontSize: 26),
        displaySmall: const TextStyle(fontSize: 24),
        headlineMedium: const TextStyle(fontSize: 22),
        headlineSmall: const TextStyle(fontSize: 20),
        titleLarge: const TextStyle(fontSize: 18),
        titleMedium: const TextStyle(fontSize: 16),
        titleSmall: const TextStyle(fontSize: 14),
        bodyLarge: const TextStyle(),
        bodyMedium: const TextStyle(),
        bodySmall: const TextStyle(),
        labelLarge: const TextStyle(fontSize: 14),
        labelSmall: const TextStyle(),
      );
}
