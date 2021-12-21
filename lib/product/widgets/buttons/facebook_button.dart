import '../../../core/constants/assets/assets_manager.dart';
import '../../../core/model/social_login_interface.dart';
import '../../../core/widget/social_media_elevated_btn.dart';
import 'package:flutter/material.dart';

class FacebookButton extends StatelessWidget {
  FacebookButton({Key? key, required this.onComplete}) : super(key: key);
  final FutureSocialCallBack onComplete;

  final ISocialLogin _socialLogin = FacebookLogin();
  @override
  Widget build(BuildContext context) {
    return SocialMediaButton(
      onPressed: () async {
        onComplete(await _socialLogin.login());
      },
      image: ImageAssets.facebookSvg,
    );
  }
}
