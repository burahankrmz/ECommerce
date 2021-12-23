import 'package:ecommerce/core/constants/assets/assets_manager.dart';
import 'package:ecommerce/core/extensions/context_extension.dart';
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
    return ListView(
      children: [
        SizedBox(
          height: context.dynamicHeight(0.66),
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
                left: context.dynamicWidth(0.046),
                top: context.dynamicHeight(0.54),
                child: AuthElevatedButton(
                  height: context.dynamicHeight(0.01),
                  width: context.dynamicWidth(0.38),
                  title: 'Check',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
