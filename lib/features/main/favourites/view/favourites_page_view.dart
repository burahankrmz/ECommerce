import 'package:flutter/material.dart';

class FavouritesPageView extends StatefulWidget {
  const FavouritesPageView({Key? key}) : super(key: key);

  @override
  _FavouritesPageViewState createState() => _FavouritesPageViewState();
}

class _FavouritesPageViewState extends State<FavouritesPageView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favourites'),
    );
  }
}
