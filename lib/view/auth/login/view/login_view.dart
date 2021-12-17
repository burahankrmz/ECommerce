import 'package:animate_do/animate_do.dart';
import 'package:ecommerce/app/app_prefs.dart';
import 'package:ecommerce/app/di.dart';
import 'package:ecommerce/core/assets/assets_manager.dart';
import 'package:ecommerce/core/constants/fonts/fonts_manager.dart';
import 'package:ecommerce/core/constants/strings/strings_manager.dart';
import 'package:ecommerce/core/init/color/color_manager.dart';
import 'package:ecommerce/core/init/routes/routes_manager.dart';
import 'package:ecommerce/core/init/styles/styles_manager.dart';
import 'package:ecommerce/product/widget/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce/core/extensions/context_extension.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey _formkey = GlobalKey<FormState>();
  final AppPrefences _appPrefences = instance<AppPrefences>();
  bool tr = true;
  bool fals = false;

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
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 34.0),
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
          SizedBox(
            height: 64,
            width: 92,
            child: ElevatedButton(
              onPressed: () {},
              child: SvgPicture.asset(ImageAssets.googleSvg),
              style: ElevatedButton.styleFrom(primary: ColorManager.white),
            ),
          ),
          SizedBox(
            height: 64,
            width: 92,
            child: ElevatedButton(
              onPressed: () {},
              child: SvgPicture.asset(ImageAssets.facebookSvg),
              style: ElevatedButton.styleFrom(primary: ColorManager.white),
            ),
          ),
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
      child: SizedBox(
        height: 48,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(AppStrings.loginBtn.tr(),
              style: getRegularStyle(color: ColorManager.white)),
        ),
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
    );
  }
}
