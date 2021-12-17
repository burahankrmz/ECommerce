import 'package:ecommerce/core/constants/strings_manager.dart';
import 'package:ecommerce/view/auth/forgot_password/view/forgot_password_view.dart';
import 'package:ecommerce/view/auth/login/view/login_view.dart';
import 'package:ecommerce/view/auth/signup/view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Routes {
  static const String loginRoute = "/login";
  static const String signUpRoute = "/signUp";
  static const String forgotPasswordRoute = "/forgotPassword";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.signUpRoute:
        return PageTransition(
            child: const SignUpView(), type: PageTransitionType.rightToLeft);
      case Routes.forgotPasswordRoute:
        return PageTransition(
            child: const ForgotPasswordView(), type: PageTransitionType.bottomToTop);
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
