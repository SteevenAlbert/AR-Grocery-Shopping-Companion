import 'package:flutter/material.dart';

import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/presentation/admin/products/components/editing_form.dart';

class EditProductPage extends StatefulWidget {
  EditProductPage({super.key, required this.product});

  final Product product;

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            EditingForm(
              product: widget.product,
            ),
          ],
        ));
  }
}
