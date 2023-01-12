import 'package:ar_grocery_companion/presentation/components/header.dart';
import 'package:ar_grocery_companion/presentation/admin/home/components/options_list.dart';
import 'package:ar_grocery_companion/presentation/admin/home/components/products_barchart.dart';
import 'package:ar_grocery_companion/presentation/admin/home/components/products_linechart.dart';
import 'package:ar_grocery_companion/presentation/home/components/drawer.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(children: [
          Header(size: size),
          BarChartSample3(),
          LineChartSample2(),
          OptionsList(),
        ]),
        drawer: CustomDrawer());
  }
}
