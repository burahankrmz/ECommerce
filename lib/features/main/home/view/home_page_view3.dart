import 'package:ecommerce/core/constants/assets/assets_manager.dart';
import 'package:ecommerce/core/extensions/context_extension.dart';
import 'package:ecommerce/core/init/color/color_manager.dart';
import 'package:ecommerce/core/init/styles/styles_manager.dart';
import 'package:flutter/material.dart';

class HomePageView3 extends StatefulWidget {
  const HomePageView3({Key? key}) : super(key: key);

  @override
  _HomePageView3State createState() => _HomePageView3State();
}

class _HomePageView3State extends State<HomePageView3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: context.s366,
            child: Stack(
              children: [
                const Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  top: 0,
                  child: Image(
                    image: AssetImage(
                      ImageAssets.home3,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: context.s305,
                  right: context.s18,
                  child: Text(
                    'New collection',
                    style: getBoldStyle(color: ColorManager.white)
                        .copyWith(fontSize: context.s34),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: context.s186,
                    width: context.screenWidthHalf,
                    child: Stack(
                      children: [
                        Positioned(
                            top: context.s59,
                            left: context.s16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Summer',
                                  style:
                                      getBoldStyle(color: ColorManager.primary)
                                          .copyWith(fontSize: context.s34),
                                ),
                                Text(
                                  'sale',
                                  style:
                                      getBoldStyle(color: ColorManager.primary)
                                          .copyWith(fontSize: context.s34),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.s186,
                    width: context.screenWidthHalf,
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: Image(
                            image: AssetImage(
                              ImageAssets.home4,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: context.s116,
                          left: context.s13,
                          child: Text(
                            'Black',
                            style: getBoldStyle(color: ColorManager.white)
                                .copyWith(fontSize: context.s34),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.s374,
                width: context.screenWidthHalf,
                child: Stack(
                  children: [
                    const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Image(
                        image: AssetImage(
                          ImageAssets.home5,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: context.s154,
                      right: context.s18,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Men' "'" "s",
                            style: getBoldStyle(color: ColorManager.white)
                                .copyWith(fontSize: context.s34),
                          ),
                          Text(
                            'hoodies',
                            style: getBoldStyle(color: ColorManager.white)
                                .copyWith(fontSize: context.s34),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
