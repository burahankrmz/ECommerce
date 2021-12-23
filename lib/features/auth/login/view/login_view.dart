import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import '../viewmodel/login_viewmodel.dart';
import '../../../state/state_renderer.impl.dart';
import 'package:flutter/scheduler.dart';
import '../../../../core/constants/values/app_sizes.dart';
import '../../../../product/widgets/buttons/facebook_button.dart';
import '../../../../product/widgets/buttons/google_button.dart';
import '../../../../product/widgets/padding/custom_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import '../../../../app/app_prefs.dart';
import '../../../../app/di.dart';
import '../../../../core/constants/fonts/fonts_manager.dart';
import '../../../../core/constants/strings/strings_manager.dart';
import '../../../../core/init/color/color_manager.dart';
import '../../../../core/init/routes/routes_manager.dart';
import '../../../../core/init/styles/styles_manager.dart';
import '../../../../core/widget/auth_elevated_button.dart';
import '../../../../product/widgets/inputs/normal_input_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey _formkey = GlobalKey<FormState>();
  final AppPrefences _appPrefences = instance<AppPrefences>();
  final LoginViewModel _viewModel = instance<LoginViewModel>();

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  _bind() {
    _viewModel.init();
    _emailEditingController.addListener(() {
      _viewModel.setEmail(_emailEditingController.text);
    });
    _passwordEditingController.addListener(() {
      _viewModel.setPassword(_passwordEditingController.text);
    });
    _viewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((isUserLoggedIN) {
      _appPrefences.setIsUserLoggedIn();
      SchedulerBinding.instance?.addPostFrameCallback((_) {
        Navigator.pushReplacementNamed(context, Routes.mainRoute);
      });
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildContentWidget();
  }

  Widget _buildContentWidget() {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushNamed(context, Routes.signUpRoute);
        return true;
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: StreamBuilder<FlowState>(
            stream: _viewModel.outputState,
            builder: (context, snapshot) {
              return snapshot.data?.getScreenWidget(context, _buildBody(), () {
                    _viewModel.login();
                  }) ??
                  _buildBody();
            }),
      ),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Padding(
        padding: const CustomPadding.pagePadding(),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLoginText(),
                const SizedBox(
                  height: AppSize.s73,
                ),
                StreamBuilder<String?>(
                    stream: _viewModel.outputEmail,
                    builder: (context, snapshot) {
                      return CustomTextField(
                          visibility: _emailEditingController.text.isNotEmpty,
                          controller: _emailEditingController,
                          error: snapshot.hasData,
                          label: AppStrings.email.tr(),
                          labelError: AppStrings.emailValid.tr());
                    }),
                Padding(
                  padding: const CustomPadding.symmetricVerticalp8(),
                  child: StreamBuilder<String?>(
                      stream: _viewModel.outputPassword,
                      builder: (context, snapshot) {
                        return CustomTextField(
                            visibility:
                                _passwordEditingController.text.isNotEmpty,
                            controller: _passwordEditingController,
                            error: snapshot.hasData,
                            label: AppStrings.password.tr(),
                            labelError: AppStrings.password.tr());
                      }),
                ),
                const SizedBox(
                  height: AppSize.s8,
                ),
                _buildForgotPasswordTextBtn(),
                const SizedBox(
                  height: AppSize.s32,
                ),
                _buildLoginBtn(),
                const SizedBox(
                  height: AppSize.s32,
                ),
                _buildOrLoginTextBtn(),
                const SizedBox(
                  height: AppSize.s16,
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
        child: TextButton(
            onPressed: () {},
            child: Text(
              AppStrings.orlogin.tr(),
              style: Theme.of(context).textTheme.bodyText1,
            )),
      ),
    );
  }

  Widget _buildLoginBtn() {
    return FadeInLeft(
      child: StreamBuilder<bool>(
        stream: _viewModel.outputIsAllValid,
        builder: (context, snapshot) {
          return AuthElevatedButton(
              width: double.maxFinite,
              height: AppSize.s48,
              title: AppStrings.loginBtn.tr(),
              onPressed: (snapshot.data ?? false)
                  ? () {
                      _viewModel.login();
                    }
                  : null);
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
      toolbarHeight: AppSize.s44,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.signUpRoute);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
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

  @override
  void dispose() {
    _viewModel.dispose();
    _emailEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }
}
