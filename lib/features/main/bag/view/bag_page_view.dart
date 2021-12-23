import 'package:flutter/material.dart';

class BagPageView extends StatefulWidget {
  const BagPageView({Key? key}) : super(key: key);

  @override
  _BagPageViewState createState() => _BagPageViewState();
}

class _BagPageViewState extends State<BagPageView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Bag'),
    );
  }
}
