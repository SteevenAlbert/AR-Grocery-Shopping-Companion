import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/presentation/components/products_grid.dart';
import 'package:flutter/material.dart';

class FeaturedProducts extends StatefulWidget {
  final Size size;
  final String cat_id;
  FeaturedProducts({super.key, required this.size, required this.cat_id});

  @override
  State<FeaturedProducts> createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  List<Product> products = [];
  @override
  Widget build(BuildContext context) {
    products = ProductsRepository.instance.getProducts();

    if (widget.cat_id != "0") {
      products = products
          .where((i) => i.customCategory.id == widget.cat_id)
          .toList();
    }

    return ProductsGrid(products: products);
  }
}
