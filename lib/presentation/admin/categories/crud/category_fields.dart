import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/data/repositories/categories_repository.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:go_router/go_router.dart';

CategoriesRepository categories = CategoriesRepository.instance;

class CategoryFields extends StatefulWidget {
  const CategoryFields(
      {super.key,
      required this.formKey,
      required this.add,
      required this.customCategory});

  final GlobalKey<FormState> formKey;
  final bool add;
  final CustomCategory customCategory;
  @override
  State<CategoryFields> createState() => _CategoryFieldsState();
}

class _CategoryFieldsState extends State<CategoryFields> {
  var myController;

  @override
  Widget build(BuildContext context) {
    final myController = widget.add
        ? TextEditingController(text: "")
        : TextEditingController(text: widget.customCategory.name);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            controller: myController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the category name';
              }
              if (value.length >= 15) {
                return 'The name should be at most 15 characters';
              }
              return null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (widget.formKey.currentState!.validate()) {
                      CustomCategory category = widget.customCategory
                          .copyWith(name: myController.text);
                      print(category);
                      widget.add
                          ? categories.insert(category)
                          : categories.update(category);
                      context.go('/admin_homepage');
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
