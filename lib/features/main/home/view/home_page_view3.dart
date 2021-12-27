import '../../../../core/constants/assets/assets_manager.dart';
import '../../../../core/extensions/context_extension.dart';
import '../../../../core/init/color/color_manager.dart';
import '../../../../core/init/styles/styles_manager.dart';
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
            height: context.h366,
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
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: context.h305,
                  right: context.w18,
                  child: Text(
                    'New collection',
                    style: getBoldStyle(color: ColorManager.white)
                        .copyWith(fontSize: context.h34),
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
                    height: context.h186,
                    width: context.w187,
                    child: Stack(
                      children: [
                        Positioned(
                            top: context.h59,
                            left: context.w16,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Summer',
                                  style:
                                      getBoldStyle(color: ColorManager.primary)
                                          .copyWith(fontSize: context.h34),
                                ),
                                Text(
                                  'sale',
                                  style:
                                      getBoldStyle(color: ColorManager.primary)
                                          .copyWith(fontSize: context.h34),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: context.h186,
                    width: context.w187,
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
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          top: context.h116,
                          left: context.w13,
                          child: Text(
                            'Black',
                            style: getBoldStyle(color: ColorManager.white)
                                .copyWith(fontSize: context.h34),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.h374,
                width: context.w188,
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
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: context.h154,
                      right: context.w18,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Men' "'" "s",
                            style: getBoldStyle(color: ColorManager.white)
                                .copyWith(fontSize: context.h34),
                          ),
                          Text(
                            'hoodies',
                            style: getBoldStyle(color: ColorManager.white)
                                .copyWith(fontSize: context.h34),
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
