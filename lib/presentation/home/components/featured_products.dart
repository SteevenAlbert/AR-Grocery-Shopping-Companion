import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/presentation/home/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FeaturedProducts extends ConsumerWidget {
  final Size size;
  FeaturedProducts({super.key, required this.size});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<List<Product>> products =
        ref.watch(ProductsRepository.instance.productsListFutureProvider);
    return FutureBuilder(
      future: products,
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return GridView.count(
            physics: ScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: (MediaQuery.of(context).size.width ~/ 200).toInt(),
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            children: List.generate(snapshot.data!.length, (index) {
              return Center(
                child:
                    ProductCard(sectionID: 1, product: snapshot.data![index]),
              );
            }),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
