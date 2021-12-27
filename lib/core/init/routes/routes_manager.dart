import '../../../features/main/view/main_view.dart';

import '../../../app/di.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../../features/auth/forgot_password/view/forgot_password_view.dart';
import '../../../features/auth/login/view/login_view.dart';
import '../../../features/auth/signup/view/signup_view.dart';
import '../../constants/strings/strings_manager.dart';

class Routes {
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signUp";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/mainRoute";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.signUpRoute:
        initSignUpModule();
        return PageTransition(
            child: const SignUpView(), type: PageTransitionType.rightToLeft);
      case Routes.forgotPasswordRoute:
        initForgotPasswordModule();
        return PageTransition(
            child: const ForgotPasswordView(),
            type: PageTransitionType.bottomToTop);
      case Routes.mainRoute:
        initHomeModule();
        return PageTransition(
            child: const MainView(), type: PageTransitionType.fade);
      default:
        return undefinedRoute();
    }
  }
}

Route<dynamic> undefinedRoute() {
  return PageTransition(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.undefinedRoute),
        ),
        body: const Center(
          child: Text(AppStrings.undefinedRoute),
        ),
      ),
      type: PageTransitionType.fade);
}
