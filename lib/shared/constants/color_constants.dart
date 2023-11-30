import 'package:flutter/material.dart';

class ColorConstants {
  static Color black = Color(0xFF000000);
  static Color white = Color(0xFFFFFFFF);

  static Color kPrimary = Color(0xFF8BC75A);

  static Color red = Color(0xFFFF0000);
  static Color splashColor1 = Color(0xFFDAB0FF);
  static Color splashColor2 = Color(0xFF57198E);
}

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

// Color fromHex(String hex) {
//   assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
//       'hex color must be #rrggbb or #rrggbbaa');

//   return Color(
//     int.parse(hex.substring(1), radix: 16) +
//         (hex.length == 7 ? 0xff000000 : 0x00000000),
//   );
// }
