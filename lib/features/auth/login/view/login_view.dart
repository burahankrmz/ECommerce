import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/core/constants/values/app_sizes.dart';
import 'package:ecommerce/product/widgets/buttons/facebook_button.dart';
import 'package:ecommerce/product/widgets/buttons/google_button.dart';
import 'package:ecommerce/product/widgets/padding/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../../../app/app_prefs.dart';
import '../../../../app/di.dart';
import '../../../../core/constants/fonts/fonts_manager.dart';
import '../../../../core/constants/strings/strings_manager.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/color/color_manager.dart';
import '../../../../core/init/routes/routes_manager.dart';
import '../../../../core/init/styles/styles_manager.dart';
import '../../../../core/widget/auth_elevated_button.dart';
import '../../../../product/widgets/inputs/normal_input_field.dart';
import 'user_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey _formkey = GlobalKey<FormState>();
  final AppPrefences _appPrefences = instance<AppPrefences>();

  Future<void> _checkUserControl(String name, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    if (name == User.mockUser.name && password == User.mockUser.password) {}
  }

  @override
  Widget build(BuildContext context) {
    return _buildContentWidget();
  }

  Widget _buildContentWidget() {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const CustomPadding.pagePadding(),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLoginText(),
                SizedBox(
                  height: context.dynamicHeight(0.09),
                ),
                CustomTextField(
                    error: false,
                    label: AppStrings.name.tr(),
                    labelError: AppStrings.emailValid),
                CustomTextField(
                    error: false,
                    label: AppStrings.password.tr(),
                    labelError: AppStrings.password),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                _buildForgotPasswordTextBtn(),
                SizedBox(
                  height: context.dynamicHeight(0.04),
                ),
                _buiildLoginBtn(),
                SizedBox(
                  height: context.dynamicHeight(0.05),
                ),
                _buildOrLoginTextBtn(),
                SizedBox(
                  height: context.dynamicHeight(0.02),
                ),
                _buildSocialMediaBtns()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialMediaBtns() {
    return FadeInLeft(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GoogleButton(onComplete: (token) {}),
          FacebookButton(onComplete: (token) {})
        ],
      ),
    );
  }

  Widget _buildOrLoginTextBtn() {
    return FadeInLeft(
      child: Align(
        alignment: Alignment.center,
        child:
            TextButton(onPressed: () {}, child: Text(AppStrings.orlogin.tr())),
      ),
    );
  }

  Widget _buiildLoginBtn() {
    return FadeInLeft(
      child: AuthElevatedButton(
        width: double.maxFinite,
        height: AppSize.s48,
        title: AppStrings.loginBtn.tr(),
        onPressed: () async {
          await _checkUserControl('veli', '1234');
        },
      ),
    );
  }

  Widget _buildForgotPasswordTextBtn() {
    return FadeInLeft(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.forgotPasswordRoute);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.forgotPasswordRoute);
              },
              child: Text(
                AppStrings.forgotPassword.tr(),
                style: getSemiBoldStyle(
                  color: ColorManager.black,
                  fontSize: FontSize.s14,
                ),
              ),
            ),
            Icon(
              Icons.arrow_right_alt,
              size: 24,
              color: ColorManager.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginText() {
    return FadeInLeft(
      child: Text(
        AppStrings.login.tr(),
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: ColorManager.background,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: ColorManager.black,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            _appPrefences.setLanguageChanged();
            Phoenix.rebirth(context);
          },
          icon: const Icon(
            Icons.language,
          ),
        ),
      ],
    );
  }
}
