import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:ar_grocery_companion/presentation/home/components/product_card.dart';
import 'package:flutter/material.dart';

class FeaturedProducts extends StatefulWidget {
  final Size size;
  final int cat_index;
  FeaturedProducts({super.key, required this.size, required this.cat_index});

  @override
  State<FeaturedProducts> createState() => _FeaturedProductsState();
}

class _FeaturedProductsState extends State<FeaturedProducts> {
  var products;
  @override
  Widget build(BuildContext context) {
    products = ProductsRepository.instance.getProducts();

    if (widget.cat_index != 0) {
      products = products
          .where((i) => i.category == CustomCategory.all[widget.cat_index])
          .toList();
    }

    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: (MediaQuery.of(context).size.width ~/ 200).toInt(),
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: List.generate(products.length, (index) {
        return Center(
          child: ProductCard(sectionID: 1, product: products[index]),
        );
      }),
    );
  }
}
