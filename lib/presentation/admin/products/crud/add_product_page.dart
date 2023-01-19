import 'package:ar_grocery_companion/presentation/admin/products/crud/add_product_form.dart';
import 'package:ar_grocery_companion/utils.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context),
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Add Product",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              )),
          AddProductForm(),
        ],
      ),
    );
  }
}
