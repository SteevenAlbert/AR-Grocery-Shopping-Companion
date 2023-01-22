import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';

class CustomLineChart extends StatefulWidget {
  const CustomLineChart({super.key});

  @override
  State<CustomLineChart> createState() => CustomLineChartState();
}

class CustomLineChartState extends State<CustomLineChart> {
  List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  bool showAvg = false;

  final int _divider = 25;

  List<FlSpot> _values = const [];

  double _minX = 0;
  double _maxX = 0;
  double _minY = 0;
  double _maxY = 0;

  @override
  void initState() {
    super.initState();
    _prepareStockData();
  }

  void _prepareStockData() {
    final List data = ["1", "2", "3"];

    double minY = double.maxFinite;
    double maxY = double.minPositive;

    _values = data.map((datum) {
      var rand = Random().nextInt(20);
      // if (minY > rand) minY = rand;
      // if (maxY < rand) maxY = rand;

      return FlSpot(
          // datum.createdAt.millisecondsSinceEpoch.toDouble(),
          rand.toDouble(),
          (rand % 20));
    }).toList();

    _minX = _values.first.x;
    _maxX = _values.last.x;
    _minY = (minY / _divider).floorToDouble() * _divider;
    _maxY = (maxY / _divider).ceilToDouble() * _divider;

    _maxY = 20;
    _maxX = 20;
    _minX = 0;
    _minY = 0;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AspectRatio(
          aspectRatio: 1,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                right: 18,
                left: 12,
                top: 24,
                bottom: 12,
              ),
              child: LineChart(
                mainData(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    String text;

    // final DateTime date =
    //         DateTime.fromMillisecondsSinceEpoch(value.toInt());
    // text = DateFormat.MMM().format(date);
    text = value.toInt() % 4 == 0 ? value.toString() : "";

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text(text),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text = value.toString();

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 4,
        verticalInterval: 4,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Theme.of(context).hintColor.withOpacity(0.1),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Theme.of(context).hintColor.withOpacity(0.1),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 10,
            getTitlesWidget: leftTitleWidgets,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Theme.of(context).hintColor.withOpacity(0.1)),
      ),
      minX: _minX,
      maxX: _maxX,
      minY: _minY,
      maxY: _maxY,
      lineBarsData: [
        LineChartBarData(
          spots: _values,
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
