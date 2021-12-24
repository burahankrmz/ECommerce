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
          ),
          SizedBox(
            height: context.h33,
          ),
          Column(
            children: [
              ListTile(
                title: Text(
                  'New',
                  style: getBoldStyle(
                      color: ColorManager.black, fontSize: context.h34),
                ),
                subtitle: Text(
                  "You" "'" "ve never seen it before",
                  style: getLightStyle(
                      color: ColorManager.grey, fontSize: context.h11),
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    'View all',
                    style: getRegularStyle(
                        color: ColorManager.black, fontSize: context.h11),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: context.w6, top: context.h14),
                child: SizedBox(
                  height: context.h260,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.w8, vertical: context.h8),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  width: context.w148,
                                  height: context.h184,
                                  child: const Image(
                                    image: AssetImage(
                                      ImageAssets.product1,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                  top: context.h8,
                                  left: context.w10,
                                  child: Container(
                                    width: context.w40,
                                    height: context.h24,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        color: ColorManager.black),
                                    child: Center(
                                      child: Text(
                                        "NEW",
                                        style: getRegularStyle(
                                            color: ColorManager.white,
                                            fontSize: context.h11),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.w8, vertical: context.h8),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  width: context.w148,
                                  height: context.h184,
                                  child: const Image(
                                    image: AssetImage(
                                      ImageAssets.product2,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                  top: context.h8,
                                  left: context.w10,
                                  child: Container(
                                    width: context.w40,
                                    height: context.h24,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        color: ColorManager.black),
                                    child: Center(
                                      child: Text(
                                        "NEW",
                                        style: getRegularStyle(
                                            color: ColorManager.white,
                                            fontSize: context.h11),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.w8, vertical: context.h8),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                SizedBox(
                                  width: context.w148,
                                  height: context.h184,
                                  child: const Image(
                                    image: AssetImage(
                                      ImageAssets.product3,
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Positioned(
                                  top: context.h8,
                                  left: context.w10,
                                  child: Container(
                                    width: context.w40,
                                    height: context.h24,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(24),
                                        color: ColorManager.black),
                                    child: Center(
                                      child: Text(
                                        "NEW",
                                        style: getRegularStyle(
                                            color: ColorManager.white,
                                            fontSize: context.h11),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
