import 'package:ar_grocery_companion/presentation/admin/categories/crud/add_category_fields.dart';
import 'package:ar_grocery_companion/presentation/admin/components/image_adder.dart';
import 'package:flutter/material.dart';

class AddCategoryForm extends StatefulWidget {
  const AddCategoryForm({super.key});

  @override
  State<AddCategoryForm> createState() => _AddCategoryFormState();
}

class _AddCategoryFormState extends State<AddCategoryForm> {
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
                children: [
                  ImageAdder(label: "Category Image",),
                  Expanded(child: AddCategoryFields(formKey: formKey)),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ImageAdder(label: "Category Image",), AddCategoryFields(formKey: formKey)],
              );
            }
          },
        ),
      ),
    );
  }
}