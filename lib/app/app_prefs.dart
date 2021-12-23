// ignore: constant_identifier_names
import 'dart:ui';

import 'package:ecommerce/core/init/lang/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const String PREFS_KEY_LANG = 'PREFS_KEY_LANG';
// ignore: constant_identifier_names
const String PREFS_KEY_THEME = 'PREFS_KEY_THEME';
// ignore: constant_identifier_names
const String PREFS_KEY_ONBOARDING_SCREEN = 'PREFS_KEY_ONBOARDING_SCREEN';
// ignore: constant_identifier_names
const String PREFS_KEY_USER_LOGGED_IN = 'PREFS_KEY_USER_LOGGED_IN';
// ignore: constant_identifier_names
const String LIGHT_THEME = 'light';
// ignore: constant_identifier_names
const String DARK_THEME = 'dark';
// ignore: constant_identifier_names
const String SCREEN_WIDTH = 'SCREEN_WIDTH';
// ignore: constant_identifier_names
const String SCREEN_HEIGHT = 'SCREEN_HEIGHT';

class AppPrefences {
  final SharedPreferences _sharedPreferences;
  var physicalScreenSize = window.physicalSize;
  var pixelRatio = window.devicePixelRatio;
  var padding = window.padding;
  AppPrefences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> setLanguageChanged() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.TURKISH.getValue()) {
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.TURKISH.getValue());
    }
  }

  Future<Locale> getLocale() async {
    String currentLanguage = await getAppLanguage();
    if (currentLanguage == LanguageType.TURKISH.getValue()) {
      return TURKISH_LOCALE;
    } else {
      return ENGLISH_LOCALE;
    }
  }

  Future<String> getAppTheme() async {
    String? light = _sharedPreferences.getString(PREFS_KEY_THEME);

    if (light != null && light.isNotEmpty) {
      return light;
    } else {
      return DARK_THEME;
    }
  }

  Future<void> setThemeChanged() async {
    String currentTheme = await getAppTheme();
    if (currentTheme == LIGHT_THEME) {
      _sharedPreferences.setString(PREFS_KEY_LANG, LIGHT_THEME);
    } else {
      _sharedPreferences.setString(PREFS_KEY_LANG, DARK_THEME);
    }
  }

  Future<String> getThemeStyle() async {
    String currentLanguage = await getAppTheme();
    if (currentLanguage == DARK_THEME) {
      return DARK_THEME;
    } else {
      return LIGHT_THEME;
    }
  }

  Future<void> setIsUserLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_USER_LOGGED_IN) ?? false;
  }

  Future<bool> logout() async {
    return _sharedPreferences.remove(PREFS_KEY_USER_LOGGED_IN);
  }

  getScreenPaddingLeftRight() {
    var paddingLeft = window.padding.left / window.devicePixelRatio;
    var paddingRight = window.padding.right / window.devicePixelRatio;
    return paddingLeft + paddingRight;
  }

  getScreenTopBottom() {
    var paddingTop = window.padding.top / window.devicePixelRatio;
    var paddingBottom = window.padding.bottom / window.devicePixelRatio;
    return paddingTop + paddingBottom;
  }

  getScreenWidth() {
    var paddingWidth = getScreenPaddingLeftRight();
    return ((physicalScreenSize / pixelRatio).width - paddingWidth);
  }

  getScreenHeight() {
    var paddingHeight = getScreenTopBottom();
    return ((physicalScreenSize / pixelRatio).height - paddingHeight);
  }

  figmaToAppHeight(double val) {
    return (val * getScreenHeight()) / 812;
  }

  figmaToAppWidth(double val) {
    return (val * getScreenWidth()) / 376;
  }
}
