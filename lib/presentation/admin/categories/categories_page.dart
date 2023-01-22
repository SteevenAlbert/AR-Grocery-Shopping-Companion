import 'package:ar_grocery_companion/presentation/admin/categories/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoriesList(snapshot: snapshot),
        ],
      ),
      Padding(
        padding: EdgeInsets.all(16),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              context.push('/add_category_page');
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    ]);
  }
}
