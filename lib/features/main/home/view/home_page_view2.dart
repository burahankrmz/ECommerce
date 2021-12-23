import 'package:ecommerce/core/constants/assets/assets_manager.dart';
import 'package:ecommerce/core/extensions/context_extension.dart';
import 'package:ecommerce/core/init/color/color_manager.dart';
import 'package:ecommerce/core/init/styles/styles_manager.dart';
import 'package:flutter/material.dart';

class HomePageView2 extends StatefulWidget {
  const HomePageView2({Key? key}) : super(key: key);

  @override
  _HomePageView2State createState() => _HomePageView2State();
}

class _HomePageView2State extends State<HomePageView2> {
  @override
  Widget build(BuildContext context) {
    debugPrint(context.s376.toString());
    return SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: context.s376,
            child: Stack(
              children: [
                const Positioned(
                  left: 0,
                  right: 0,
                  child: Image(
                    image: AssetImage(
                      ImageAssets.home2,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: context.s136,
                  left: context.s16,
                  child: Text(
                    'Street clothes',
                    style: getBoldStyle(color: ColorManager.white)
                        .copyWith(fontSize: context.s34),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
