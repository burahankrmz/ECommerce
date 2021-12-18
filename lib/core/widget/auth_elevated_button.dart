import '../init/color/color_manager.dart';
import '../init/styles/styles_manager.dart';
import 'package:flutter/material.dart';

typedef FutureCallBack = Future<void> Function();

class AuthElevatedButton extends StatefulWidget {
  const AuthElevatedButton(
      {Key? key,
      required this.title,
      this.width,
      this.height,
      this.primaryColor,
      required this.onPressed})
      : super(key: key);
  final double? width;
  final double? height;
  final String title;
  final Color? primaryColor;
  final FutureCallBack onPressed;
  @override
  _AuthElevatedButtonState createState() => _AuthElevatedButtonState();
}

class _AuthElevatedButtonState extends State<AuthElevatedButton> {
  bool _isLoading = false;
  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _completeProcess() async {
    _changeLoading();
    await widget.onPressed();
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return !_isLoading
        ? ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(widget.width?? 0, widget.height ?? 0),
            ),
            onPressed: _isLoading ? null : _completeProcess,
            child: Text(
              widget.title,
              style: getRegularStyle(
                color: ColorManager.white,
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(
              backgroundColor: ColorManager.primary,
              color: ColorManager.white,
            ),
          );
  }
}
