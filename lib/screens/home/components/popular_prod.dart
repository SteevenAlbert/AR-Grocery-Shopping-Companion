import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ar_grocery_companion/screens/home/components/product_card.dart';
import 'package:ar_grocery_companion/models/product.dart';

class ProductCarousel extends StatelessWidget {
  final Size size;
  const ProductCarousel({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(viewportFraction: 0.4, height: 180),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 0.5),
                child: ProductCard(
                    sectionID: 0, size: size, product: Product.all[i]));
          },
        );
      }).toList(),
    ));
  }
}
