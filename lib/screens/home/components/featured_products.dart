import 'package:ar_grocery_companion/models/product.dart';
import 'package:ar_grocery_companion/screens/home/components/product_card.dart';
import 'package:flutter/material.dart';

class FeaturedProducts extends StatefulWidget {
  final Size size;
  FeaturedProducts({super.key, required this.size});

  @override
  State<FeaturedProducts> createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        children: List.generate(Product.all.length, (index) {
          return Center(
            child: ProductCard(size: widget.size, product: Product.all[index]),
          );
        }),
      ),
    );
  }
}
