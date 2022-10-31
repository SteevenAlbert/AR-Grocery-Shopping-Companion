import 'package:ar_grocery_companion/screens/admin/products/components/product_card.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/product.dart';
import '../../home/components/featured_products.dart';

Widget alternativeProducts(Size size) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 8.0),
    child: GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: List.generate(Product.all.length, (index) {
        return Center(
          child: ProductCard(size: size, product: Product.all[index]),
        );
      }),
    ),
  );
}
