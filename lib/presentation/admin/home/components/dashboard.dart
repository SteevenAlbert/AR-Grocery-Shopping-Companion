import 'package:ar_grocery_companion/presentation/admin/home/components/info_card_grid.dart';
import 'package:ar_grocery_companion/presentation/components/header.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
            children: [
              SizedBox(height: 8.0,),
              Header(size: size),
              InfoCardGrid(),
            ],
          );
  }
}