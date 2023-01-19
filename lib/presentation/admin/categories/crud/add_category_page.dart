import 'package:ar_grocery_companion/presentation/admin/categories/crud/add_category_form.dart';
import 'package:ar_grocery_companion/utils.dart';
import 'package:flutter/material.dart';

class AddCategoryPage extends StatelessWidget {
  AddCategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context),
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Add Category",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              )),
          AddCategoryForm(),
        ],
      ),
    );
  }
}
