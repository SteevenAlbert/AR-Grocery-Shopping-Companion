import 'package:flutter/material.dart';

import 'package:ar_grocery_companion/presentation/admin/home/components/chart_card.dart';
import 'package:ar_grocery_companion/presentation/admin/home/components/line_chart.dart';

class ChartCardsGrid extends StatelessWidget {
  const ChartCardsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GridView.count(
      padding: EdgeInsets.all(8.0),
      physics: ScrollPhysics(),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      shrinkWrap: true,
      crossAxisCount: size.width ~/ 350,
      childAspectRatio: 1 / 1.1,
      children: [
        //ChartCard(title: "Manufacturers", chart: CustomPieChart()),
        ChartCard(title: "Engagement", chart: CustomLineChart()),
      ],
    );
  }
}
