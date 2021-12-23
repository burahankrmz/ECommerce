import 'package:ecommerce/core/constants/assets/assets_manager.dart';
import 'package:ecommerce/core/init/color/color_manager.dart';
import 'package:ecommerce/core/init/styles/styles_manager.dart';
import 'package:ecommerce/core/widget/auth_elevated_button.dart';
import 'package:flutter/material.dart';

class HomePageView1 extends StatefulWidget {
  const HomePageView1({ Key? key }) : super(key: key);

  @override
  _HomePageView1State createState() => _HomePageView1State();
}

class _HomePageView1State extends State<HomePageView1> {
  @override
  Widget build(BuildContext context) {
     return Stack(
      children: [
        Positioned(
          top: -44.0,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.asset(ImageAssets.home, fit: BoxFit.contain),
          ),
        ),
        Positioned(
          top: 310,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Fashion',
                  style: getBoldStyle(color: ColorManager.white)
                      .copyWith(fontSize: 48),
                ),
                Text(
                  'sale',
                  style: getBoldStyle(color: ColorManager.white)
                      .copyWith(fontSize: 48),
                ),
                AuthElevatedButton(
                  height: 36,
                  width: 160,
                  title: 'Check',
                  onPressed: () {},
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}