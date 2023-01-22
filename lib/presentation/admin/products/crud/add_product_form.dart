import 'package:ar_grocery_companion/presentation/components/image_adder.dart';
import 'package:ar_grocery_companion/presentation/admin/products/crud/add_product_fields.dart';
import 'package:flutter/material.dart';

class AddProductForm extends StatefulWidget {
  const AddProductForm({super.key});

  @override
  State<AddProductForm> createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    //TODO: handle imageAdder callback

    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return AddProductFields(formKey: formKey, constraints: constraints);
          },
        ),
      ),
    );
  }
}
