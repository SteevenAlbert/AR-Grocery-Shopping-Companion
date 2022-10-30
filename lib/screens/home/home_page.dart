import 'package:ar_grocery_companion/screens/home/components/featured_products.dart';
import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/components/categories_bar.dart';
import 'package:ar_grocery_companion/components/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
      Header(size: size),
      const CategoriesBar(),
      SizedBox(height:20),
      FeaturedProducts(size:size),
    ]);
  }
}
