import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../core/init/routes/routes_manager.dart';
import '../viewmodel/forgot_password_viewmodel.dart';
import '../../../state/state_renderer.impl.dart';
import '../../../../app/app_prefs.dart';
import '../../../../app/di.dart';
import '../../../../core/constants/strings/strings_manager.dart';
import '../../../../core/constants/values/app_sizes.dart';
import '../../../../core/widget/auth_elevated_button.dart';
import '../../../../product/widgets/inputs/normal_input_field.dart';
import '../../../../product/widgets/padding/custom_padding.dart';
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
  final TextEditingController _emailEditingController = TextEditingController();
  final ForgotPasswordViewModel _viewModel =
      instance<ForgotPasswordViewModel>();
  _bind() {
    _viewModel.init();
    _emailEditingController
        .addListener(() => _viewModel.setEmail(_emailEditingController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data
                    ?.getScreenWidget(context, _buildContentWidget(), () {
                  _viewModel.forgotPassword();
                }) ??
                _buildContentWidget();
          }),
    );
  }

  Widget _buildContentWidget() {
    return SafeArea(
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
                  child: StreamBuilder<bool>(
                      stream: _viewModel.outputIsEmailValid,
                      builder: (context, snapshot) {
                        return CustomTextField(
                          visibility: _emailEditingController.text.isNotEmpty,
                          controller: _emailEditingController,
                          error: (snapshot.hasData) ? !snapshot.data! : false,
                          label: AppStrings.email.tr(),
                          labelError: AppStrings.emailValid.tr(),
                        );
                      }),
                ),
                const SizedBox(height: AppSize.s55),
                _buildSendBtn()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSendBtn() {
    return FadeInLeft(
      child: StreamBuilder<bool>(
          stream: _viewModel.outputIsAllInputValid,
          builder: (context, snapshot) {
            return AuthElevatedButton(
              width: double.maxFinite,
              height: AppSize.s48,
              title: AppStrings.sendBtn.tr(),
              onPressed: (snapshot.data ?? false)
                  ? () {
                      _viewModel.forgotPassword();
                      Timer(const Duration(seconds: 5), () {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginRoute);
                      });
                    }
                  : null,
            );
          }),
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
      toolbarHeight: AppSize.s44,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
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
    super.dispose();
  }
}
