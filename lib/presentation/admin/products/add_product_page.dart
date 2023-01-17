import 'package:ar_grocery_companion/presentation/admin/products/components/adding_form.dart';
import 'package:ar_grocery_companion/utils.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context),
      body:ListView(
      children: [
        AddingForm(),
      ],
    ));
  }
}
