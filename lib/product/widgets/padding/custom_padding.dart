import '../../../core/constants/values/app_sizes.dart';
import 'package:flutter/material.dart';

class CustomPadding extends EdgeInsets {
  const CustomPadding() : super.all(10);
  const CustomPadding.allp18()
      : super.all(AppSize.s18);
  const CustomPadding.pagePadding()
      : super.symmetric(horizontal: AppSize.s16, vertical: AppSize.s18);
  const CustomPadding.symmetricVerticalp16()
      : super.symmetric(vertical: AppSize.s16);
  const CustomPadding.symmetricVerticalp8()
      : super.symmetric(vertical: AppSize.s8);
  const CustomPadding.onlyTopP8() : super.only(top: AppSize.s8);
  const CustomPadding.onlyTopP8BottomP16()
      : super.only(top: AppSize.s8, bottom: AppSize.s16);
}
