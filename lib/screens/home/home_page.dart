import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/components/categories_bar.dart';
import 'package:ar_grocery_companion/components/header.dart';
import 'package:ar_grocery_companion/models/product.dart';
import 'components/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Header(size: size),
      const CategoriesBar(),
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductCard(size: size, product: products[0]),
              ProductCard(size: size, product: products[1]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductCard(size: size, product: products[2]),
              ProductCard(size: size, product: products[3]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductCard(size: size, product: products[4]),
              ProductCard(size: size, product: products[5]),
            ],
          ),
        ],
      ),
    ]));
  }
}
