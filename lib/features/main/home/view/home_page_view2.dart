import 'package:ecommerce/core/constants/assets/assets_manager.dart';
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
    return Stack(
      children: [
        Positioned(
          top: 0,
          child: Container(
            height: 260,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    ImageAssets.home2,
                  ),
                  fit: BoxFit.contain),
            ),
          ),
        ),
        Positioned(
          top: 158,
          child: Padding(
            padding: const EdgeInsets.only(left: 21.0, bottom: 18.0),
            child: Text(
              'Street clothes',
              style: getBoldStyle(color: ColorManager.white)
                  .copyWith(fontSize: 34),
            ),
          ),
        )
      ],
    );
  }
}
