import 'package:flutter/material.dart';
import 'package:grape_customer_app/presentation/core/styles/styles.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
  }) {
    return ThemeData(
      fontFamily: 'SFPro',
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: Colors.black87,
      primaryColorDark: Colors.black87,
      dividerTheme: DividerThemeData(color: AppColors.black.withOpacity(0.20)),
      // primarySwatch: Colors.black,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: AppColors.primary,
        onPrimary: AppColors.primary,
        secondary: AppColors.primary,
        onSecondary: AppColors.primary,
        error: Colors.redAccent,
        onError: Colors.redAccent,
        background: Colors.white,
        onBackground: Colors.white,
        surface: Colors.black87,
        onSurface: Colors.black87,
      ),
    );
  }

  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
      );

  static ThemeData get darkTheme => createTheme(
        brightness: Brightness.dark,
      );
}
