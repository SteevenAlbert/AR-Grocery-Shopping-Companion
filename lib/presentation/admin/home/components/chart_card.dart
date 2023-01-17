import 'package:flutter/material.dart';

class ChartCard extends StatelessWidget {
  ChartCard({super.key, required this.chart});

  final Widget chart;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
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
                "Products",
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
