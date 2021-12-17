import 'package:ecommerce/app/app_prefs.dart';
import 'package:ecommerce/app/di.dart';
import 'package:ecommerce/core/constants/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey _formkey = GlobalKey<FormState>();
  final AppPrefences _appPrefences = instance<AppPrefences>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              _appPrefences.setLanguageChanged();
              Phoenix.rebirth(context);
            },
            icon: const Icon(
              Icons.language,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                Text(AppStrings.signup.tr())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
