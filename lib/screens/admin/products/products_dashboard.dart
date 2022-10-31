import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../models/product.dart';
import 'components/product_card.dart';

class ProductsDashboard extends StatefulWidget {
  const ProductsDashboard({super.key});

  @override
  State<ProductsDashboard> createState() => _ProductsDashboardState();
}

class _ProductsDashboardState extends State<ProductsDashboard> {
  List products = Product.all;

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("All products"),
        ),
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
            SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: List.generate(products.length, (index) {
                  return Center(
                    child: ProductCard(
                        size: size,
                        product: products[index],
                        voidCallback: () {
                          Product.remove(products[index]);
                          setState(() {});
                        }),
                  );
                }),
              ),
            ),
          ],
        ));
  }
}
