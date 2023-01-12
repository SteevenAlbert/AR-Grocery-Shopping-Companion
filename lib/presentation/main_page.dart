import 'package:ar_grocery_companion/presentation/components/nav_bar.dart';
import 'package:ar_grocery_companion/utils.dart';
import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/presentation/home/components/drawer.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: buildAppBar(context: context),
        body: const Navbar(),
        drawer: CustomDrawer());
  }
}
