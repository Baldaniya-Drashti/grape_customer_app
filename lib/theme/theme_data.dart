import 'package:flutter/material.dart';
import 'package:grape_customer_app/shared/constants/constants.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
  }) {
    return ThemeData(
      fontFamily: 'SfPro',
      scaffoldBackgroundColor: ColorConstants.white,
    );
  }

  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
      );

  static ThemeData get darkTheme => createTheme(
        brightness: Brightness.dark,
      );
}
