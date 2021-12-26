import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get screenWidthHalfv2 => MediaQuery.of(this).size.width / 2;
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;
  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;
  double figmaToAppWidth(double val) =>
      (val * MediaQuery.of(this).size.width) / 375;
  double figmaToAppHeight(double val) =>
      (val * MediaQuery.of(this).size.height) / 812;
  // double figmaToAppWidth(double val) =>
  //     (val * 392) / 375;
  // double figmaToAppHeight(double val) =>
  //     (val * 872) / 812;
  ThemeData get theme => Theme.of(this);
}

extension AppHeight on BuildContext {
  double get h5 => figmaToAppHeight(5);
  double get h7 => figmaToAppHeight(7);
  double get h8 => figmaToAppHeight(8);
  double get h11 => figmaToAppHeight(11);
  double get h13 => figmaToAppHeight(13);
  double get h14 => figmaToAppHeight(14);
  double get h15 => figmaToAppHeight(15);
  double get h16 => figmaToAppHeight(16);
  double get h18 => figmaToAppHeight(18);
  double get h22 => figmaToAppHeight(22);
  double get h24 => figmaToAppHeight(24);
  double get h32 => figmaToAppHeight(32);
  double get h33 => figmaToAppHeight(33);
  double get h34 => figmaToAppHeight(34);
  double get h36 => figmaToAppHeight(36);
  double get h48 => figmaToAppHeight(48);
  double get h59 => figmaToAppHeight(59);
  double get h64 => figmaToAppHeight(64);
  double get h92 => figmaToAppHeight(92);
  double get h116 => figmaToAppHeight(116);
  double get h136 => figmaToAppHeight(136);
  double get h154 => figmaToAppHeight(154);
  double get h160 => figmaToAppHeight(160);
  double get h170 => figmaToAppHeight(170);
  double get h171 => figmaToAppHeight(171);
  double get h172 => figmaToAppHeight(172);
  double get h173 => figmaToAppHeight(173);
  double get h174 => figmaToAppHeight(174);
  double get h175 => figmaToAppHeight(175);
  double get h176 => figmaToAppHeight(176);
  double get h177 => figmaToAppHeight(177);
  double get h178 => figmaToAppHeight(178);
  double get h184 => figmaToAppHeight(184);
  double get h186 => figmaToAppHeight(186);
  double get h187 => figmaToAppHeight(187);
  double get h188 => figmaToAppHeight(188);
  double get h260 => figmaToAppHeight(260);
  double get h305 => figmaToAppHeight(305);
  double get h354 => figmaToAppHeight(354);
  double get h366 => figmaToAppHeight(366);
  double get h372 => figmaToAppHeight(372);
  double get h374 => figmaToAppHeight(374);
  double get h376 => figmaToAppHeight(376);
  double get h466 => figmaToAppHeight(466);
  double get h536 => figmaToAppHeight(536);
  double get h580 => figmaToAppHeight(580);
}

extension AppWidth on BuildContext {
  double get w6 => figmaToAppWidth(6);
  double get w8 => figmaToAppWidth(8);
  double get w10 => figmaToAppWidth(10);
  double get w13 => figmaToAppWidth(13);
  double get w16 => figmaToAppWidth(16);
  double get w18 => figmaToAppWidth(18);
  double get w32 => figmaToAppWidth(32);
  double get w34 => figmaToAppWidth(34);
  double get w36 => figmaToAppWidth(36);
  double get w40 => figmaToAppWidth(40);
  double get w48 => figmaToAppWidth(48);
  double get w59 => figmaToAppWidth(59);
  double get w64 => figmaToAppWidth(64);
  double get w92 => figmaToAppWidth(92);
  double get w116 => figmaToAppWidth(116);
  double get w136 => figmaToAppWidth(136);
  double get w148 => figmaToAppWidth(148);
  double get w150 => figmaToAppWidth(150);
  double get w154 => figmaToAppWidth(154);
  double get w160 => figmaToAppWidth(160);
  double get w170 => figmaToAppWidth(170);
  double get w171 => figmaToAppWidth(171);
  double get w172 => figmaToAppWidth(172);
  double get w173 => figmaToAppWidth(173);
  double get w174 => figmaToAppWidth(174);
  double get w175 => figmaToAppWidth(175);
  double get w176 => figmaToAppWidth(176);
  double get w177 => figmaToAppWidth(177);
  double get w178 => figmaToAppWidth(178.4);
  double get w186 => figmaToAppWidth(186);
  double get w187 => figmaToAppWidth(187);
  double get w188 => figmaToAppWidth(188);
  double get w305 => figmaToAppWidth(305);
  double get w354 => figmaToAppWidth(354);
  double get w366 => figmaToAppWidth(366);
  double get w372 => figmaToAppWidth(372);
  double get w374 => figmaToAppWidth(374);
  double get w376 => figmaToAppWidth(376);
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
