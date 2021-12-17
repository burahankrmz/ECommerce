import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app_prefs.dart';
import 'di.dart';
import '../view/home/view/homepage.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPrefences _appPrefences = instance<AppPrefences>();
  @override
  void didChangeDependencies() {
    _appPrefences.getLocale().then((locale) => {context.setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const HomePage(),
    );
  }
}
