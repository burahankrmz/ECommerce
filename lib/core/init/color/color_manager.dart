import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#DB3022");
  static Color primaryOpacity70 = HexColor.fromHex("#B3DB3022");
  static Color background = HexColor.fromHex("#F9F9F9");
  static Color grey = HexColor.fromHex("#9B9B9B");
  static Color black = HexColor.fromHex("#2222222");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color success = HexColor.fromHex("#2AA952");
  static Color error = HexColor.fromHex("#B822222");
  static Color saleHot = HexColor.fromHex("#DB3022");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = 'FF' + hexColorString;
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
