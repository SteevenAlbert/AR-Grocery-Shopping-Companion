import 'package:ar_grocery_companion/presentation/components/header.dart';
import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/presentation/admin/home/components/info_cards_grid.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;
  
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 8.0,
        ),
        Header(size: MediaQuery.of(context).size),
        InfoCardGrid(snapshot: snapshot),
        //ChartCardsGrid(),
      ],
    );
  }
}
