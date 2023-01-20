import 'package:ar_grocery_companion/presentation/admin/categories/crud/category_fields.dart';
import 'package:ar_grocery_companion/presentation/admin/components/image_adder.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:flutter/material.dart';

class CategoryForm extends StatefulWidget {
  const CategoryForm(
      {super.key, required this.add, required this.customCategory});
  final bool add;
  final CustomCategory customCategory;

  @override
  State<CategoryForm> createState() => _CategoryFormState();
}

class _CategoryFormState extends State<CategoryForm> {
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
                  ImageAdder(
                    label: "Category Image",
                  ),
                  Expanded(
                      child: CategoryFields(
                          customCategory: widget.customCategory,
                          formKey: formKey,
                          add: widget.add)),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageAdder(
                    label: "Category Image",
                  ),
                  CategoryFields(
                      customCategory: widget.customCategory,
                      formKey: formKey,
                      add: widget.add)
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
