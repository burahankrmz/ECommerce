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
            height: context.h536,
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
                  top: context.h354,
                  left: context.w16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Fashion',
                        style: getBoldStyle(color: ColorManager.white)
                            .copyWith(fontSize: context.h48),
                      ),
                      Text(
                        'sale',
                        style: getBoldStyle(color: ColorManager.white)
                            .copyWith(fontSize: context.h48),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: context.h466,
                  left: context.w16,
                  child: AuthElevatedButton(
                    width: context.h160,
                    height: context.w36,
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
