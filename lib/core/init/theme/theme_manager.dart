import 'package:ecommerce/core/constants/fonts/fonts_manager.dart';
import 'package:ecommerce/core/init/color/color_manager.dart';
import 'package:ecommerce/core/init/styles/styles_manager.dart';
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
        backgroundColor: ColorManager.white),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: getHelperStyle(),
      hintStyle: getHelperStyle(),
    ),
    textTheme: TextTheme(
      headline1:
          getBoldStyle(color: ColorManager.black, fontSize: FontSize.s34),
      headline2:
          getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s24),
      headline3:
          getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s18),
      subtitle1:
          getSemiBoldStyle(color: ColorManager.black, fontSize: FontSize.s16),
      bodyText1:
          getRegularStyle(color: ColorManager.black, fontSize: FontSize.s16),
      caption:
          getRegularStyle(color: ColorManager.black, fontSize: FontSize.s14),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorManager.black1,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),

        ),
      ),
    ),
  );
}
