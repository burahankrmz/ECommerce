import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../../app/app_prefs.dart';
import '../../../app/di.dart';
import '../../../core/constants/strings/strings_manager.dart';
import '../../../core/init/color/color_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AppPrefences _appPrefences = instance<AppPrefences>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _appPrefences.setLanguageChanged();
              Phoenix.rebirth(context);
            },
            icon:  Icon(
              Icons.language,
              color: ColorManager.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(AppStrings.welcome.tr()),
      ),
    );
  }
}
