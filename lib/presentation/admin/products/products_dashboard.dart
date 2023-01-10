import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../models/product/product.dart';
import 'components/product_card.dart';

import 'package:ar_grocery_companion/presentation/home/components/drawer.dart';

class ProductsDashboard extends StatefulWidget {
  const ProductsDashboard({super.key});

  @override
  State<ProductsDashboard> createState() => _ProductsDashboardState();
}

class _ProductsDashboardState extends State<ProductsDashboard> {
  List products = Product.all;

  @override
  Widget build(BuildContext context) {
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
            GoRouter.of(context).pop();
            GoRouter.of(context).push('/add_product_page');
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: (MediaQuery.of(context).size.width ~/ 200).toInt(),
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: List.generate(products.length, (index) {
                  return ProductCard(
                      product: products[index],
                      voidCallback: () {
                        // TODO: remove
                        //Product.remove(products[index]);
                        setState(() {});
                      });
                }),
              ),
            ),
          ],
        ));
  }
}
