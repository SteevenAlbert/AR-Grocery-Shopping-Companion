import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/components/categories_bar.dart';
import 'package:ar_grocery_companion/screens/home/components/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(size: size),
          const CategoriesBar(),
        ],
      ),
    );
  }
}
