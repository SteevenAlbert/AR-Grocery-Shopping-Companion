import 'dart:math';

import 'package:ar_grocery_companion/data/repositories/companies_repository.dart';
import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

/// Icons by svgrepo.com (https://www.svgrepo.com/collection/job-and-professions-3/)
class CustomPieChart extends StatefulWidget {
  const CustomPieChart({super.key});

  @override
  State<StatefulWidget> createState() => CustomPieChartState();
}

class CustomPieChartState extends State {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        color: Colors.white,
        child: AspectRatio(
          aspectRatio: 1,
          child: PieChart(
            PieChartData(
              pieTouchData: PieTouchData(
                touchCallback: (FlTouchEvent event, pieTouchResponse) {
                  setState(() {
                    if (!event.isInterestedForInteractions ||
                        pieTouchResponse == null ||
                        pieTouchResponse.touchedSection == null) {
                      touchedIndex = -1;
                      return;
                    }
                    touchedIndex =
                        pieTouchResponse.touchedSection!.touchedSectionIndex;
                  });
                },
              ),
              borderData: FlBorderData(
                show: false,
              ),
              sectionsSpace: 0,
              centerSpaceRadius: 0,
              sections: showingSections(),
            ),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    List<Company> companies = CompaniesRepository.instance.getCompanies();
    return List.generate(companies.length, (index) {
      final isTouched = index == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;

      var productsNum = companies[index].products?.length;
      double opacity = productsNum != null ?productsNum*0.1:0.1;
      return PieChartSectionData(
        color: Theme.of(context).primaryColor.withOpacity(opacity),
        value: productsNum?.toDouble(),
        title: "${productsNum}",
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
        ),
        badgeWidget: _Badge(
          companies[index].logoPath!,
          name:companies[index].name,
          size: widgetSize,
          borderColor: Theme.of(context).primaryColor.withOpacity(opacity),
        ),
        badgePositionPercentageOffset: .98,
      );
    });
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.logo, {
    required this.name,
    required this.size,
    required this.borderColor,
  });
  final String name;
  final String logo;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: name,
      child: AnimatedContainer(
        duration: PieChart.defaultDuration,
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black.withOpacity(.5),
              offset: const Offset(3, 3),
              blurRadius: 3,
            ),
          ],
        ),
        padding: EdgeInsets.all(size * .15),
        child: Center(
          child: Image.asset(
            logo,
          ),
        ),
      ),
    );
  }
}
