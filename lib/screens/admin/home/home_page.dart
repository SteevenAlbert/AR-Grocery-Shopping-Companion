import 'package:ar_grocery_companion/screens/admin/home/components/options_list.dart';
import 'package:ar_grocery_companion/components/header.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(children: [
      Header(size: size),
      OptionsList(),
    ]);
  }
}
