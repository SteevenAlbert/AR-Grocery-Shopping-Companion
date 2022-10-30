import 'package:ar_grocery_companion/screens/admin/products/components/adding_form.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:ListView(
      children: [
        AddingForm(),
      ],
    ));
  }
}
