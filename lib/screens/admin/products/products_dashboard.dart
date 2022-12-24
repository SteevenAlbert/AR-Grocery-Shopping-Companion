import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../models/product.dart';
import 'components/product_card.dart';

import 'package:ar_grocery_companion/screens/home/components/drawer.dart';

class ProductsDashboard extends ConsumerWidget {
  ProductsDashboard({super.key});

  final productsProvider = Provider<List<Product>>((ref) {
    return Product.all;
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("All products"),
          backgroundColor: Theme.of(context).canvasColor,
          foregroundColor: Theme.of(context).primaryColor,
          elevation: 0,
        ),
        drawer: CustomDrawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            GoRouter.of(context).push('/add_product_page');
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            Expanded(
              child: Consumer(
                builder: (context, ref, _) {
                  final products = ref.watch(productsProvider);
                  return GridView.count(
                    crossAxisCount:
                        (MediaQuery.of(context).size.width ~/ 200).toInt(),
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    children: List.generate(products.length, (index) {
                      return Center(
                        child: ProductCard(
                            product: products[index],
                            voidCallback: () {
                              Product.remove(products[index]);
                            }),
                      );
                    }),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
