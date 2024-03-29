import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/constants/assets/assets_manager.dart';
import '../../core/constants/fonts/fonts_manager.dart';
import '../../core/constants/strings/strings_manager.dart';
import '../../core/constants/values/app_sizes.dart';
import '../../core/init/color/color_manager.dart';
import '../../core/init/network/failure/failure.dart';
import '../../core/init/styles/styles_manager.dart';
import '../../product/widgets/padding/custom_padding.dart';

enum StateRendererType {
//? POPUP STATES
  // ignore: constant_identifier_names
  POPUP_LOADING_STATE,
  // ignore: constant_identifier_names
  POPUP_ERROR_STATE,

  //? FULL SCREEN STATES
  // ignore: constant_identifier_names
  FULL_SCREEN_LOADING_STATE,
  // ignore: constant_identifier_names
  FULL_SCREEN_ERROR_STATE,

  //? CONTENT STATE
  // ignore: constant_identifier_names
  CONTENT_SCREEN_STATE, //? THE UI OF THE SCREEN

  // ignore: constant_identifier_names
  EMPTY_SCREEN_STATE, //? EMPTY VIEW WHEN WE RECEIVE NOT DATA FROM API SIDE FOR LIST SCREEN

  //? SUCCESS STATE
  // ignore: constant_identifier_names
  POPUP_SUCCESS
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String message;
  final String title;
  final Function? retryActionFunction;
  StateRenderer(
      {Key? key,
      required this.stateRendererType,
      Failure? failure,
      String? message,
      String? title,
      this.retryActionFunction})
      : message = message ?? AppStrings.loading.tr(),
        title = title ?? "",
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.POPUP_LOADING_STATE:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAssets.loading),
        ]);
      case StateRendererType.POPUP_ERROR_STATE:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAssets.error),
          _getMessage(message),
          _getRetryButton(AppStrings.ok.tr(), context)
        ]);
      case StateRendererType.FULL_SCREEN_LOADING_STATE:
        return _getItemsInColumn(
            [_getAnimatedImage(JsonAssets.loading), _getMessage(message)]);
      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        return _getItemsInColumn([
          _getAnimatedImage(JsonAssets.error),
          _getMessage(message),
          _getRetryButton(AppStrings.retryAgain.tr(), context)
        ]);
      case StateRendererType.POPUP_SUCCESS:
        return _getPopUpDialog(context, [
          _getAnimatedImage(JsonAssets.success),
          _getMessage(title),
          _getMessage(message)
        ]);
      case StateRendererType.CONTENT_SCREEN_STATE:
        return Container();
      case StateRendererType.EMPTY_SCREEN_STATE:
        return _getItemsInColumn(
            [_getAnimatedImage(JsonAssets.empty), _getMessage(message)]);
      default:
        return Container();
    }
  }

  Widget _getPopUpDialog(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.s14),
      ),
      elevation: AppSize.s1_5,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(AppSize.s14),
            boxShadow:  [
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: AppSize.s12,
                  offset: Offset(AppSize.s0, AppSize.s12))
            ]),
        child: _getDialogContent(context, children),
      ),
    );
  }

  Widget _getRetryButton(String buttonTitle, BuildContext context) {
    return Center(
      child: Padding(
        padding: const CustomPadding.allp18(),
        child: SizedBox(
          width: AppSize.s100,
          child: ElevatedButton(
            onPressed: () {
              if (stateRendererType ==
                  StateRendererType.FULL_SCREEN_ERROR_STATE) {
                retryActionFunction?.call();
              } else {
                Navigator.of(context).pop();
              }
            },
            child: Text(
              buttonTitle,
              style: getRegularStyle(color: ColorManager.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getAnimatedImage(String animationName) {
    return SizedBox(
      height: AppSize.s100,
      width: AppSize.s100,
      child: Lottie.asset(animationName),
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const CustomPadding.allp18(),
        child: Text(
          message,
          style:
              getMediumStyle(color: ColorManager.black, fontSize: FontSize.s16),
        ),
      ),
    );
  }

  Widget _getDialogContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getItemsInColumn(List<Widget> children) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}
