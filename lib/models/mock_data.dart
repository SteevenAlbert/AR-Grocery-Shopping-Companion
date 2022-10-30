import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MockData {
  static BarChartGroupData makeGroupData(
      int x, double y1, Color barColor, double width) {
    return BarChartGroupData(
      barsSpace: 1,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          // colors: [barColor],
          width: width,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
      ],
    );
  }

  static List<BarChartGroupData> getBarChartitems(Color color,
      {double width = 20}) {
    return [
      makeGroupData(0, 5, color, width),
      makeGroupData(1, 6, color, width),
      makeGroupData(2, 8, color, width),
      makeGroupData(3, 5, color, width),
      makeGroupData(4, 7, color, width),
      makeGroupData(5, 9, color, width),
      makeGroupData(6, 3, color, width),
    ];
  }
}
