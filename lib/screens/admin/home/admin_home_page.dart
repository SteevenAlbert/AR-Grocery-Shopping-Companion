import 'package:ar_grocery_companion/screens/admin/home/components/options_list.dart';
import 'package:ar_grocery_companion/screens/admin/home/components/products_barchart.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ProductsBarChart(),
      OptionsList(),
    ]);
  }
}
