import 'package:flutter/material.dart';

import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/presentation/components/products_grid.dart';

class FeaturedProducts extends StatelessWidget {
  FeaturedProducts(
      {super.key,
      required this.size,
      required this.cat_id,
      required this.products});
  final Size size;
  final String cat_id;
  final List<Product> products;

  @override
  Widget build(BuildContext context) {

    if (cat_id != "0") {
      List<Product> cat_products = products.where((i) => i.customCategory.id == cat_id).toList();
      return ProductsGrid(products: cat_products);
    }

    return ProductsGrid(products: products);
  }
}
