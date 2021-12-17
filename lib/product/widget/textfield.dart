import 'package:animate_do/animate_do.dart';
import 'package:ecommerce/core/constants/fonts/fonts_manager.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/core/init/color/color_manager.dart';
import 'package:ecommerce/core/init/styles/styles_manager.dart';

class CustomTextField extends StatelessWidget {
  final bool error;
  final String label;
  final String labelError;

  const CustomTextField({
    Key? key,
    required this.error,
    required this.label,
    required this.labelError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          children: [
            Material(
              elevation: 1,
              child: Container(
                width: double.infinity,
                height: 64,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  border: error == true
                      ? Border.all(color: ColorManager.errorTextfield)
                      : Border.all(color: Colors.transparent),
                ),
                child: Center(
                  child: TextFormField(
                    style: getRegularStyle(
                        color: ColorManager.black1, fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(12.0),
                      label: Text(
                        label,
                      ),
                      border: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.check,
                        color: ColorManager.success,
                        size: 24,
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
      ),
    );
  }
}
