import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/fonts/fonts_manager.dart';
import '../color/color_manager.dart';
import '../styles/styles_manager.dart';

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
      onPrimary: ColorManager.black,
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
        backgroundColor: ColorManager.background),
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
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: ColorManager.white,
      selectedItemColor: ColorManager.primary,
      unselectedItemColor: ColorManager.grey,
    ),
  );
}

ThemeData getDarkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManagerDark.background,
    colorScheme: ColorScheme(
      primary: ColorManagerDark.primary,
      primaryVariant: ColorManagerDark.primaryOpacity70,
      secondary: ColorManager.white,
      secondaryVariant: ColorManager.grey,
      surface: ColorManager.white,
      background: ColorManager.white,
      error: ColorManager.error,
      onPrimary: ColorManagerDark.navigationWhite,
      onSecondary: ColorManager.white,
      onSurface: ColorManager.black,
      onBackground: ColorManager.black,
      onError: ColorManager.error,
      brightness: Brightness.light,
    ),
    splashColor: ColorManagerDark.primaryOpacity70,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: ColorManagerDark.black,
      ),
      elevation: 0,
      backgroundColor: ColorManagerDark.background,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: getHelperStyle(),
      hintStyle: getHelperStyle(),
    ),
    textTheme: TextTheme(
      headline1: getBoldStyle(
          color: ColorManagerDark.ordinaryText, fontSize: FontSize.s34),
      headline2: getSemiBoldStyle(
          color: ColorManagerDark.ordinaryText, fontSize: FontSize.s24),
      headline3: getSemiBoldStyle(
          color: ColorManagerDark.ordinaryText, fontSize: FontSize.s18),
      subtitle1: getSemiBoldStyle(
          color: ColorManagerDark.ordinaryText, fontSize: FontSize.s16),
      bodyText1: getRegularStyle(
          color: ColorManagerDark.ordinaryText, fontSize: FontSize.s16),
      caption: getRegularStyle(
          color: ColorManagerDark.ordinaryText, fontSize: FontSize.s14),
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
    iconTheme: IconThemeData(
      color: ColorManagerDark.white,
    ),
    primaryIconTheme: IconThemeData(
      color: ColorManagerDark.white,
    ),
  );
}
