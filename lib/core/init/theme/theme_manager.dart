import 'package:ecommerce/core/init/color/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData getLightTheme() {
  return ThemeData(
    colorScheme: ColorScheme(
      primary: ColorManager.primary,
      primaryVariant: ColorManager.primaryOpacity70,
      secondary: ColorManager.white,
      secondaryVariant: ColorManager.grey,
      surface: ColorManager.white,
      background: ColorManager.white,
      error: ColorManager.error,
      onPrimary: ColorManager.primaryOpacity70,
      onSecondary: ColorManager.white,
      onSurface: ColorManager.black,
      onBackground: ColorManager.black,
      onError: ColorManager.error,
      brightness: Brightness.light,
    ),
    splashColor: ColorManager.primaryOpacity70,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: ColorManager.white,
      ),
      elevation: 0,
      backgroundColor: ColorManager.white
    ),
  );
}
