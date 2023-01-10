// import 'package:ar_grocery_companion/screens/home/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/presentation/components/header.dart';
import 'package:ar_grocery_companion/presentation/home/components/featured_products.dart';
// import 'package:ar_grocery_companion/screens/home/components/popular_products.dart';
import 'package:ar_grocery_companion/presentation/home/components/tabs.dart';
import 'package:ar_grocery_companion/presentation/home/components/carousel.dart';
import 'package:ar_grocery_companion/presentation/search/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(children: [
      Header(size: size),
      Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SearchBar(size: size),
            CarouselSliderExample(),
            // ProductCarousel(size: size),
            // SizedBox(height: 12),
            Cat_Tabs(size: size),
            SizedBox(height: 12),
            FeaturedProducts(size: size)
          ],
        ),
      ),
    ]));
  }
}
