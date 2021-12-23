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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    debugPrint(width.toString() + "   " + height.toString());

    return SafeArea(
      child: ListView(
        children: [
          SizedBox(
            height: context.dynamicHeight(0.91),
            child: Column(
              children: [
                const Expanded(
                  child: Image(
                    image: AssetImage(
                      ImageAssets.home3,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 49,
                              child: Container(
                                width: double.maxFinite,
                                color: ColorManager.white,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Summer',
                                        style: getRegularStyle(
                                                color: ColorManager.primary)
                                            .copyWith(fontSize: 34),
                                      ),
                                      Text(
                                        'sale',
                                        style: getRegularStyle(
                                                color: ColorManager.primary)
                                            .copyWith(fontSize: 34),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 50,
                              child: Image(
                                image: AssetImage(
                                  ImageAssets.home4,
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: Image(
                          image: AssetImage(
                            ImageAssets.home5,
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
