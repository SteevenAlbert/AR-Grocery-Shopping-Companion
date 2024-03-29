import 'package:flutter/material.dart';

class ChartCard extends StatelessWidget {
  ChartCard({super.key, required this.chart, required this.title});

  final Widget chart;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:16.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                  child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)
              )),
              chart,
            ],
          ),
        ),
      ),
    );
  }
}
