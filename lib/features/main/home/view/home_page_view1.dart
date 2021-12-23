import 'package:ecommerce/core/constants/assets/assets_manager.dart';
import 'package:ecommerce/core/extensions/context_extension.dart';
import 'package:ecommerce/core/init/color/color_manager.dart';
import 'package:ecommerce/core/init/styles/styles_manager.dart';
import 'package:ecommerce/core/widget/auth_elevated_button.dart';
import 'package:flutter/material.dart';

class HomePageView1 extends StatefulWidget {
  const HomePageView1({Key? key}) : super(key: key);

  @override
  _HomePageView1State createState() => _HomePageView1State();
}

class _HomePageView1State extends State<HomePageView1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: context.s536,
            child: Stack(
              children: [
                const Positioned(
                  left: 0,
                  right: 0,
                  child: Image(
                    image: AssetImage(
                      ImageAssets.home,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: context.s354,
                  left: context.s16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fashion',
                        style: getBoldStyle(color: ColorManager.white)
                            .copyWith(fontSize: context.s48),
                      ),
                      Text(
                        'sale',
                        style: getBoldStyle(color: ColorManager.white)
                            .copyWith(fontSize: context.s48),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: context.s466,
                  left: context.s16,
                  child: AuthElevatedButton(
                    width: context.s160,
                    height: context.s36,
                    title: 'Check',
                    onPressed: () {},
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
