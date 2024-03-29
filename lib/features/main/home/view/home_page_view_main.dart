import 'dart:math';
import 'home_page_view1.dart';
import 'home_page_view2.dart';
import 'home_page_view3.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({Key? key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late Random rnd;
  List<Widget> pages = [
    const HomePageView1(),
    const HomePageView2(),
    const HomePageView3(),
  ];

  // ignore: unused_element
  _randomPage() {
    int min = 0;
    int max = 3;
    rnd = Random();
    var r = min + rnd.nextInt(max - min);
    return r;
  }

  @override
  Widget build(BuildContext context) {
    return const HomePageView1();
  }
}
