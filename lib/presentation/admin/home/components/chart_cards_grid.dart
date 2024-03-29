import 'package:ar_grocery_companion/presentation/admin/home/components/pie_chart.dart';
import 'package:flutter/material.dart';

import 'package:ar_grocery_companion/presentation/admin/home/components/chart_card.dart';

class ChartCardsGrid extends StatelessWidget {
  const ChartCardsGrid({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ChartCard(title: "Manufacturers", chart: CustomPieChart(snapshot: snapshot));
    // return GridView.count(
    //   padding: EdgeInsets.all(8.0),
    //   physics: ScrollPhysics(),
    //   mainAxisSpacing: 8.0,
    //   crossAxisSpacing: 8.0,
    //   shrinkWrap: true,
    //   crossAxisCount: size.width ~/ 350,
    //   childAspectRatio: 1 / 1.1,
    //   children: [
    //     ChartCard(title: "Manufacturers", chart: CustomPieChart(snapshot: snapshot)),
    //     //ChartCard(title: "Engagement", chart: CustomLineChart()),
    //   ],
    // );
  }
}
