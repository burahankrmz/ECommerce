import 'package:animate_do/animate_do.dart';
import 'package:ecommerce/core/constants/values/app_sizes.dart';
import '../../../core/constants/fonts/fonts_manager.dart';
import 'package:flutter/material.dart';
import '../../../core/init/color/color_manager.dart';
import '../../../core/init/styles/styles_manager.dart';

class CustomTextField extends StatelessWidget {
  final bool error;
  final String label;
  final String labelError;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.error,
    required this.label,
    required this.labelError, required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Column(
        children: [
          Material(
            elevation: 1,
            child: Container(
              width: double.infinity,
              height: AppSize.s64,
              decoration: BoxDecoration(
                color: ColorManager.white,
                border: error == true
                    ? Border.all(color: ColorManager.errorTextfield)
                    : Border.all(color: Colors.transparent),
              ),
              child: Center(
                child: TextFormField(
                  controller: controller,
                  style: getRegularStyle(
                      color: ColorManager.black1, fontSize: AppSize.s16),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12.0),
                    label: Text(
                      label,
                    ),
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.check,
                      color: ColorManager.success,
                      size: AppSize.s24,
                    ),
                  ),
                ),
              ),
            ),
          ),
          error == true
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    labelError,
                    style: getRegularStyle(
                        color: ColorManager.errorTextfield,
                        fontSize: FontSize.s12),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
