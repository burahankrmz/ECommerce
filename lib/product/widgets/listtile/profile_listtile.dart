import 'package:ecommerce/core/extensions/context_extension.dart';
import 'package:ecommerce/core/init/color/color_manager.dart';
import 'package:ecommerce/core/init/styles/styles_manager.dart';
import 'package:ecommerce/core/widget/auth_elevated_button.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.context,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final FutureCallBack onTap;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
      title: Text(
        title,
        style: getBoldStyle(color: ColorManager.black, fontSize: context.h16),
      ),
      subtitle: Text(
        subtitle,
        style: getLightStyle(color: ColorManager.grey, fontSize: context.h11),
      ),
      trailing: const Icon(Icons.arrow_forward_ios_sharp),
    );
  }
}
