import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/app/app_prefs.dart';
import 'package:ecommerce/app/di.dart';
import 'package:ecommerce/core/constants/strings/strings_manager.dart';
import 'package:ecommerce/core/constants/values/app_sizes.dart';
import 'package:ecommerce/core/init/color/color_manager.dart';
import 'package:ecommerce/core/widget/auth_elevated_button.dart';
import 'package:ecommerce/product/widgets/inputs/normal_input_field.dart';
import 'package:ecommerce/product/widgets/padding/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final GlobalKey _formkey = GlobalKey<FormState>();
  final AppPrefences _appPrefences = instance<AppPrefences>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const CustomPadding.pagePadding(),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildForgotText(),
                  const SizedBox(height: AppSize.s87),
                  _builddDescriptionText(),
                  Padding(
                    padding: const CustomPadding.symmetricVerticalp16(),
                    child: CustomTextField(
                      error: true,
                      label: AppStrings.email.tr(),
                      labelError: AppStrings.emailValid.tr(),
                    ),
                  ),
                  const SizedBox(height: AppSize.s55),
                  _buildSendBtn()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSendBtn() {
    return FadeInLeft(
      child: AuthElevatedButton(
        width: double.maxFinite,
        height: AppSize.s48,
        title: AppStrings.sendBtn.tr(),
        onPressed: () async {
          // ignore: avoid_returning_null_for_void
          return null;
        },
      ),
    );
  }

  Widget _builddDescriptionText() {
    return FadeInLeft(
      child: Text(
        AppStrings.forgotText.tr(),
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  Widget _buildForgotText() {
    return FadeInLeft(
      child: Text(
        AppStrings.forgotPasswordText.tr(),
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
