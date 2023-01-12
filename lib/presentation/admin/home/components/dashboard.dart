import 'package:ar_grocery_companion/presentation/admin/home/components/products_linechart.dart';
import 'package:ar_grocery_companion/presentation/components/header.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
            children: [
              Header(size: size),
              LineChartSample2(size: size),
            ],
          );
  }
}