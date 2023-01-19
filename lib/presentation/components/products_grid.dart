import 'package:flutter/material.dart';

import 'package:ar_grocery_companion/domain/models/product/product.dart';

import '../home/components/product_card.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: (MediaQuery.of(context).size.width ~/ 200).toInt(),
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: List.generate(products.length, (index) {
        print(products[index].name);
        return Center(
          child: ProductCard(sectionID: 1, product: products[index]),
        );
      }),
    );
  }
}
