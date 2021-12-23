import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;
  double figmaToAppWidth(double val) =>
      (val * MediaQuery.of(this).size.width) / 375;
  double figmaToAppHeight(double val) =>
      (val * MediaQuery.of(this).size.height) / 812;
  ThemeData get theme => Theme.of(this);
}

extension AppSizes on BuildContext {
  double get s13 => figmaToAppHeight(13);
  double get s16 => figmaToAppHeight(16);
  double get s18 => figmaToAppHeight(18);
  double get s32 => figmaToAppHeight(32);
  double get s34 => figmaToAppHeight(34);
  double get s36 => figmaToAppHeight(36);
  double get s48 => figmaToAppHeight(48);
  double get s59 => figmaToAppHeight(59);
  double get s64 => figmaToAppHeight(64);
  double get s92 => figmaToAppHeight(92);
  double get s116 => figmaToAppHeight(116);
  double get s136 => figmaToAppHeight(136);
  double get s154 => figmaToAppHeight(154);
  double get s160 => figmaToAppHeight(160);
  double get s170 => figmaToAppHeight(170);
  double get s171 => figmaToAppHeight(171);
  double get s172 => figmaToAppHeight(172);
  double get s173 => figmaToAppHeight(173);
  double get s174 => figmaToAppHeight(174);
  double get s175 => figmaToAppHeight(175);
  double get s176 => figmaToAppHeight(176);
  double get s177 => figmaToAppHeight(177);
  double get s178 => figmaToAppHeight(178.4);
  double get screenWidthHalf => figmaToAppHeight(182.7);
  double get s186 => figmaToAppHeight(186);
  double get s187 => figmaToAppHeight(187);
  double get s188 => figmaToAppHeight(188);
  double get s305 => figmaToAppHeight(305);
  double get s354 => figmaToAppHeight(354);
  double get s366 => figmaToAppHeight(366);
  double get s372 => figmaToAppHeight(372);
  double get s374 => figmaToAppHeight(374);
  double get s376 => figmaToAppHeight(376);
  double get s466 => figmaToAppHeight(466);
  double get s536 => figmaToAppHeight(536);
}

extension NumberExtension on BuildContext {
  double get lowHeightValue => dynamicHeight(0.01);
  double get mediumHeightValue => dynamicHeight(0.03);
  double get highHeightValue => dynamicHeight(0.05);
  double get lowWidthValue => dynamicWidth(0.01);
  double get mediumWidthValue => dynamicWidth(0.03);
  double get highWidthValue => dynamicWidth(0.05);
}

extension PaddingExtension on BuildContext {
  EdgeInsets dynamicVerticalPadding(double val) =>
      EdgeInsets.symmetric(vertical: dynamicHeight(val));
  EdgeInsets dynamicHorizontalPadding(double val) =>
      EdgeInsets.symmetric(vertical: dynamicWidth(val));
  EdgeInsets get paddingAllLow => EdgeInsets.all(dynamicHeight(0.01));
  EdgeInsets get paddingAllHigh => EdgeInsets.all(dynamicHeight(0.03));
  EdgeInsets get paddingHighHorizontalMediumVertical => EdgeInsets.symmetric(
      vertical: dynamicHeight(0.02), horizontal: dynamicHeight(0.03));
  EdgeInsets get paddingOnlyLeftLow =>
      EdgeInsets.only(left: dynamicHeight(0.01));
  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: dynamicHeight(0.01));
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: dynamicHeight(0.02));
  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: dynamicHeight(0.03));
  EdgeInsets get paddingLowVertical =>
      EdgeInsets.symmetric(horizontal: dynamicHeight(0.01));
  EdgeInsets get paddingLowMediumVertical =>
      EdgeInsets.symmetric(vertical: dynamicHeight(0.015));
  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: dynamicHeight(0.02));
  EdgeInsets get paddingMediumMediumVertical =>
      EdgeInsets.symmetric(vertical: dynamicHeight(0.025));
  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: dynamicHeight(0.04));
}

extension EmptyWidget on BuildContext {
  Widget get emptyWidgetHeight =>
      SizedBox(height: dynamicHeight(lowHeightValue));
}
