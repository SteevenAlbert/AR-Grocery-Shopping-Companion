import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/presentation/components/header.dart';
import 'package:ar_grocery_companion/presentation/home/components/tabs.dart';
import 'package:ar_grocery_companion/presentation/home/components/carousel.dart';
import 'package:ar_grocery_companion/presentation/search/search_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    Future<List<Product>> products =
        ref.watch(ProductsRepository.instance.productsListFutureProvider);
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
            FutureBuilder(
                future: products,
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    return Cat_Tabs(size: size);
                  } else if (snapshot.hasError) {
                    return Center(child: Text("${snapshot.error}"));
                  }
                  return Center(child: const CircularProgressIndicator());
                })),
            SizedBox(height: 12),
          ],
        ),
      ),
    ]));
  }
}
