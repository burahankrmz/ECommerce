import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#DB3022");
  static Color primaryOpacity70 = HexColor.fromHex("#B3DB3022");
  static Color background = HexColor.fromHex("#F9F9F9");
  static Color grey = HexColor.fromHex("#9B9B9B");
  static Color black = HexColor.fromHex("#222222");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color success = HexColor.fromHex("#2AA952");
  static Color error = HexColor.fromHex("#B82222");
  static Color errorTextfield = HexColor.fromHex("#F01F0E");
  static Color saleHot = HexColor.fromHex("#DB3022");
  static Color black1 = HexColor.fromHex("#000000");
}

class ColorManagerDark {
  static Color primary = HexColor.fromHex("#DB3022");
  static Color primaryOpacity70 = HexColor.fromHex("#B3DB3022");
  static Color background = HexColor.fromHex("#1E1F28");
  static Color grey = HexColor.fromHex("#9B9B9B");
  static Color black = HexColor.fromHex("#222222");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color success = HexColor.fromHex("#2AA952");
  static Color error = HexColor.fromHex("#B82222");
  static Color navigationWhite = HexColor.fromHex("#F6F6F6");
  static Color darkContainer = HexColor.fromHex("#2A2C36");
  static Color greyContainer = HexColor.fromHex("#ABB4BD");
  static Color errorTextfield = HexColor.fromHex("#F01F0E");
  static Color saleHot = HexColor.fromHex("#DB3022");
  static Color black1 = HexColor.fromHex("#000000");
  static Color ordinaryText = HexColor.fromHex("#F5F5F5");
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
