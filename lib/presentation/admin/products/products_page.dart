import 'package:ar_grocery_companion/presentation/admin/products/products_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductsList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/add_product_page');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}