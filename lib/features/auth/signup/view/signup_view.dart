import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/core/constants/fonts/fonts_manager.dart';
import 'package:ecommerce/core/constants/strings/strings_manager.dart';
import 'package:ecommerce/core/constants/values/app_sizes.dart';
import 'package:ecommerce/core/init/routes/routes_manager.dart';
import 'package:ecommerce/core/init/styles/styles_manager.dart';
import 'package:ecommerce/core/widget/auth_elevated_button.dart';
import 'package:ecommerce/features/auth/signup/services/signup_usecase.dart';
import 'package:ecommerce/product/widgets/buttons/facebook_button.dart';
import 'package:ecommerce/product/widgets/buttons/google_button.dart';
import 'package:ecommerce/product/widgets/inputs/normal_input_field.dart';
import 'package:ecommerce/product/widgets/padding/custom_padding.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../../../app/app_prefs.dart';
import '../../../../app/di.dart';
import '../../../../core/init/color/color_manager.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final GlobalKey _formkey = GlobalKey<FormState>();
  final AppPrefences _appPrefences = instance<AppPrefences>();
  final SingUpUseCase _singUpUseCase = instance<SingUpUseCase>();
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  @override
  void dispose() {
    _nameEditingController.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

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
                  _buildSignUpText(),
                  const SizedBox(
                    height: AppSize.s55,
                  ),
                  CustomTextField(
                    controller: _nameEditingController,
                    error: false,
                    label: AppStrings.name.tr(),
                    labelError: AppStrings.name.tr(),
                  ),
                  Padding(
                    padding: const CustomPadding.onlyTopP8(),
                    child: CustomTextField(
                      controller: _emailEditingController,
                      error: false,
                      label: AppStrings.email.tr(),
                      labelError: AppStrings.emailValid.tr(),
                    ),
                  ),
                  Padding(
                    padding: const CustomPadding.onlyTopP8BottomP16(),
                    child: CustomTextField(
                      controller: _passwordEditingController,
                      error: false,
                      label: AppStrings.password.tr(),
                      labelError: AppStrings.password.tr(),
                    ),
                  ),
                  _buildAlreadyHaveAnAccountTextBtn(),
                  _buildSignUpBtn(),
                  const SizedBox(
                    height: AppSize.s24,
                  ),
                  _buildOrLoginTextBtn(),
                  _buildSocialMediaBtns(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialMediaBtns() {
    return FadeInLeft(
      child: Padding(
        padding: const CustomPadding.symmetricVerticalp8(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GoogleButton(onComplete: (token) {}),
            FacebookButton(onComplete: (token) {})
          ],
        ),
      ),
    );
  }

  Widget _buildAlreadyHaveAnAccountTextBtn() {
    return FadeInLeft(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.loginRoute);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                _emailEditingController.clear();
                _passwordEditingController.clear();
                _nameEditingController.clear();
                Navigator.pushNamed(context, Routes.loginRoute);
              },
              child: Text(
                AppStrings.alreadyAccount.tr(),
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

  Widget _buildOrLoginTextBtn() {
    return FadeInLeft(
      child: Padding(
        padding: const CustomPadding.symmetricVerticalp8(),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            AppStrings.orlogin.tr(),
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpBtn() {
    return FadeInLeft(
      child: Padding(
        padding: const CustomPadding.symmetricVerticalp8(),
        child: AuthElevatedButton(
          width: double.maxFinite,
          height: AppSize.s48,
          title: AppStrings.signupBtn.tr(),
          onPressed: () async {
            debugPrint(_emailEditingController.text);
            (await _singUpUseCase.execute(SingUpUsecaseInput(
                    _nameEditingController.text,
                    _emailEditingController.text,
                    _passwordEditingController.text)))
                .fold(
                    (failure) => {debugPrint(failure.message)},
                    (data) => {
                          debugPrint(data.user!.uid),
                          _emailEditingController.clear(),
                          _passwordEditingController.clear()
                        });
          },
        ),
      ),
    );
  }

  Widget _buildSignUpText() {
    return FadeInLeft(
      child: Text(
        AppStrings.signup.tr(),
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
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
