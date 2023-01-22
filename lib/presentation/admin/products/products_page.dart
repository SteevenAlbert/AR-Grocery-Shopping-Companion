import 'package:ar_grocery_companion/presentation/admin/products/products_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;
  @override
   Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductsList(snapshot: snapshot),
        ],
      ),
      Padding(
        padding: EdgeInsets.all(16),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              context.push('/add_product_page');
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    ]);
  }
}