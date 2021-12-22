import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/values/app_sizes.dart';
import '../init/color/color_manager.dart';

typedef FutureCallBack = Future<void> Function();

class SocialMediaButton extends StatefulWidget {
  const SocialMediaButton(
      {Key? key,
      required this.image,
      this.primaryColor,
      required this.onPressed})
      : super(key: key);
  final String image;
  final Color? primaryColor;
  final FutureCallBack onPressed;
  @override
  _SocialMediaButtonState createState() => _SocialMediaButtonState();
}

class _SocialMediaButtonState extends State<SocialMediaButton> {
  Future<void> _completeProcess() async {
    await widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _completeProcess,
      child: SvgPicture.asset(widget.image),
      style: ElevatedButton.styleFrom(
        primary: ColorManager.white,
        fixedSize: const Size(AppSize.s92, AppSize.s64),
      ),
    );
  }
}
