import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/data/repositories/categories_repository.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:go_router/go_router.dart';

CategoriesRepository categories = CategoriesRepository.instance;

class AddCategoryFields extends StatefulWidget {
  const AddCategoryFields({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  State<AddCategoryFields> createState() => _AddCategoryFieldsState();
}

class _AddCategoryFieldsState extends State<AddCategoryFields> {
  String name = 'Nan';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            onChanged: (String? newValue) {
              setState(() {
                name = newValue!;
              });
            },
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
                      CustomCategory category =
                          CustomCategory(id: "id", name: name);
                      categories.insert(category);
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
