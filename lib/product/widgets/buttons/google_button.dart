import 'package:ecommerce/core/constants/assets/assets_manager.dart';
import 'package:ecommerce/core/model/social_login_interface.dart';
import 'package:ecommerce/core/widget/social_media_elevated_btn.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  GoogleButton({Key? key, required this.onComplete}) : super(key: key);
  final FutureSocialCallBack onComplete;

  final ISocialLogin _socialLogin = GoogleLogin();
  @override
  Widget build(BuildContext context) {
    return SocialMediaButton(
      onPressed: () async {
        onComplete(await _socialLogin.login());
      },
      image: ImageAssets.googleSvg,
    );
  }
}
