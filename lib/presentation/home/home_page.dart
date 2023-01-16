import 'package:ar_grocery_companion/data/repositories/categories_repository.dart';
import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/presentation/error_page.dart';
import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/presentation/components/header.dart';
import 'package:ar_grocery_companion/presentation/home/components/tabs.dart';
import 'package:ar_grocery_companion/presentation/home/components/carousel.dart';
import 'package:ar_grocery_companion/presentation/search/search_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ar_grocery_companion/services/connection_checker.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    Future<List<Product>> products =
        ref.watch(ProductsRepository.instance.productsListFutureProvider);
    Future<List<CustomCategory>> categories =
        ref.watch(CategoriesRepository.instance.categoriesListFutureProvider);
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

            // TODO: seperate this logic
            // TODO: think if there is a better practice to load data gradually or with each category?
            // Read the products and categories before displaying the widget
            FutureBuilder(
                future: Future.wait([products, categories]),
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
