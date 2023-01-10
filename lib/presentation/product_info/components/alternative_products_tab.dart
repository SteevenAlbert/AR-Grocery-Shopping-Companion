import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/presentation/home/components/product_card.dart';
import 'package:flutter/cupertino.dart';


Widget alternativeProducts(context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(5, 10, 5, 8.0),
    child: GridView.count(
      crossAxisCount: (MediaQuery.of(context).size.width ~/ 200).toInt(),
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      children: List.generate(ProductsRepository.queryAllDummyData().length, (index) {
        return Center(
          child: ProductCard(
            sectionID: 1,
            product: ProductsRepository.queryAllDummyData()[index],
          ),
        );
      }),
    ),
  );
}
