import 'package:ar_grocery_companion/data/repositories/categories_repository.dart';
import 'package:ar_grocery_companion/data/repositories/companies_repository.dart';
import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/presentation/admin/home/components/chart_cards_grid.dart';
import 'package:ar_grocery_companion/presentation/admin/home/components/info_cards_grid.dart';
import 'package:ar_grocery_companion/presentation/components/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<List<Product>> products =
        ref.watch(ProductsRepository.instance.productsListFutureProvider);
    Future<List<CustomCategory>> categories =
        ref.watch(CategoriesRepository.instance.categoriesListFutureProvider);
    Future<List<Company>> companies =
        ref.watch(CompaniesRepository.instance.companiesListFutureProvider);

    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: Future.wait([products, categories, companies]),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: [
              SizedBox(
                height: 8.0,
              ),
              //Header(size: size),
              InfoCardGrid(),
              ChartCardsGrid(),
            ],
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
