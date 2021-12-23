import 'package:ecommerce/core/constants/strings/strings_manager.dart';
import 'package:ecommerce/features/main/bag/view/bag_page_view.dart';
import 'package:ecommerce/features/main/favourites/view/favourites_page_view.dart';
import 'package:ecommerce/features/main/home/view/home_page_view_main.dart';
import 'package:ecommerce/features/main/profile/view/profile_page_view.dart';
import 'package:ecommerce/features/main/shop/view/shop_page_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = const [
    HomePageView(),
    ShopPageView(),
    BagPageView(),
    FavouritesPageView(),
    ProfilePageView()
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        child: BottomNavigationBar(
          onTap: onTap,
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                activeIcon: const Icon(Icons.home),
                label: AppStrings.home.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_cart_outlined),
                activeIcon: const Icon(Icons.shopping_cart_sharp),
                label: AppStrings.shop.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_bag_outlined),
                activeIcon: const Icon(Icons.shopping_bag_sharp),
                label: AppStrings.bag.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.favorite_border_outlined),
                activeIcon: const Icon(Icons.favorite_sharp),
                label: AppStrings.favourites.tr()),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person_outlined),
                activeIcon: const Icon(Icons.person_sharp),
                label: AppStrings.profile.tr()),
          ],
        ),
      ),
    );
  }

  onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
