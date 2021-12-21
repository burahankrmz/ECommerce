import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'app/app.dart';
import 'app/di.dart';
import 'core/init/lang/language_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  await initAppModule();
  runApp(
    EasyLocalization(
      supportedLocales: [ENGLISH_LOCALE, TURKISH_LOCALE],
      path: ASSETS_PATH_LOCALISATIONS,
      child: Phoenix(child: MyApp()),
    ),
  );
}
