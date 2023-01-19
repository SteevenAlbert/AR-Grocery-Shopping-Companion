import 'package:ar_grocery_companion/presentation/admin/categories/categories_list.dart';
import 'package:ar_grocery_companion/presentation/admin/components/list_card.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:16.0, left:16.0),
          child: ElevatedButton(onPressed: (){}, child: Text("Add Category")),
        ),
        ListCard(title: "Categories", list:CategoriesList()),
      ],
    );
  }
}
