import 'package:ar_grocery_companion/presentation/admin/home/components/chart_card.dart';
import 'package:ar_grocery_companion/presentation/admin/home/components/pie_chart.dart';
import 'package:flutter/material.dart';

class ChartCardsGrid extends StatelessWidget {
  const ChartCardsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GridView.count(
      padding: EdgeInsets.all(8.0),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      shrinkWrap: true,
      crossAxisCount: size.width ~/ 350,
      childAspectRatio: 1/1.1,
      children: [
        ChartCard(chart: CustomPieChart()), 
        //ChartCard(chart: CustomLineChart()), 
        ],
    );
  }
}