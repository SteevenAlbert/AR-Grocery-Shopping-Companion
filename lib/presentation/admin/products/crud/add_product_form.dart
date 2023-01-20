import 'package:ar_grocery_companion/presentation/admin/components/image_adder.dart';
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

    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageAdder(
                    label: "Product logo",
                  ),
                  Expanded(child: AddProductFields(formKey: formKey,)),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageAdder(
                    label: "Product logo",
                  ),
                  AddProductFields(formKey: formKey,)
                ],
              );
            }
          },
        ),
      ),
    );
  }
  
}