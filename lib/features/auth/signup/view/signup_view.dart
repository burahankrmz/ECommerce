import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce/core/widget/auth_elevated_button.dart';
import 'package:ecommerce/features/auth/signup/viewmodel/signup_viewmodel.dart';
import 'package:ecommerce/features/state/state_renderer.impl.dart';
import 'package:flutter/scheduler.dart';
import '../../../../core/constants/fonts/fonts_manager.dart';
import '../../../../core/constants/strings/strings_manager.dart';
import '../../../../core/constants/values/app_sizes.dart';
import '../../../../core/init/routes/routes_manager.dart';
import '../../../../core/init/styles/styles_manager.dart';
import '../../../../product/widgets/buttons/facebook_button.dart';
import '../../../../product/widgets/buttons/google_button.dart';
import '../../../../product/widgets/inputs/normal_input_field.dart';
import '../../../../product/widgets/padding/custom_padding.dart';
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
  final SignUpViewModel _viewModel = instance<SignUpViewModel>();

  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  _bind() {
    _viewModel.init();
    _nameEditingController.addListener(() {
      _viewModel.setName(_nameEditingController.text);
    });
    _emailEditingController.addListener(() {
      _viewModel.setEmail(_emailEditingController.text);
    });
    _passwordEditingController.addListener(() {
      _viewModel.setPassword(_passwordEditingController.text);
    });
    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((isSuccessLoggedIn) {
      _appPrefences.isUserLoggedIn();
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
      });
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _nameEditingController.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data?.getScreenWidget(context, _buildContentWidget(),
                  () {
                _viewModel.signUp();
              }) ??
              _buildContentWidget();
        });
  }

  Widget _buildContentWidget() {
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
                  Padding(
                    padding: const CustomPadding.onlyTopP8(),
                    child: StreamBuilder<String?>(
                        stream: _viewModel.outputName,
                        builder: (context, snapshot) {
                          return CustomTextField(
                            visibility: _nameEditingController.text.isNotEmpty,
                            controller: _nameEditingController,
                            error: snapshot.hasData,
                            label: AppStrings.name.tr(),
                            labelError: AppStrings.name.tr(),
                          );
                        }),
                  ),
                  Padding(
                    padding: const CustomPadding.onlyTopP8(),
                    child: StreamBuilder<String?>(
                        stream: _viewModel.outputEmail,
                        builder: (context, snapshot) {
                          return CustomTextField(
                            visibility: _emailEditingController.text.isNotEmpty,
                            controller: _emailEditingController,
                            error: snapshot.hasData,
                            label: AppStrings.email.tr(),
                            labelError: AppStrings.emailValid.tr(),
                          );
                        }),
                  ),
                  Padding(
                    padding: const CustomPadding.onlyTopP8BottomP16(),
                    child: StreamBuilder<String?>(
                        stream: _viewModel.outputPassword,
                        builder: (context, snapshot) {
                          return CustomTextField(
                            visibility:
                                _passwordEditingController.text.isNotEmpty,
                            controller: _passwordEditingController,
                            error: snapshot.hasData,
                            label: AppStrings.password.tr(),
                            labelError: AppStrings.password.tr(),
                          );
                        }),
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
        child: StreamBuilder<bool>(
            stream: _viewModel.outputIsAllValid,
            builder: (context, snapshot) {
              return AuthElevatedButton(
                  width: double.maxFinite,
                  height: AppSize.s48,
                  title: AppStrings.signupBtn.tr(),
                  onPressed: (snapshot.data ?? false)
                      ? () {
                          _viewModel.signUp();
                        }
                      : null);
            }),
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
