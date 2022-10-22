import 'package:flutter/material.dart';
import 'package:chip_list/chip_list.dart';
import 'package:ar_grocery_companion/models/category.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ChipList(
              listOfChipNames: Category.all.map((e) => e.title).toList(),
              activeBgColorList: [Theme.of(context).canvasColor],
              activeTextColorList: [Theme.of(context).primaryColor],
              activeBorderColorList: [Theme.of(context).primaryColor],
              inactiveBgColorList: [Theme.of(context).canvasColor],
              inactiveBorderColorList: [Theme.of(context).canvasColor],
              inactiveTextColorList: [Theme.of(context).primaryColor],
              listOfChipIndicesCurrentlySeclected: [0],
            ),
          ],
        ),
      ),
    );
  }
}
