import 'package:ar_grocery_companion/models/product/product.dart';
import 'package:ar_grocery_companion/screens/admin/products/components/editing_form.dart';
import 'package:flutter/material.dart';

class EditProductPage extends StatefulWidget {
  EditProductPage({super.key, required this.product});

  Product product;

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:ListView(
      children: [
        EditingForm(product: widget.product,),
      ],
    ));
  }
}
