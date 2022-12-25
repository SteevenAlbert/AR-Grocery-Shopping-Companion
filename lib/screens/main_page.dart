import 'package:ar_grocery_companion/components/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/screens/home/components/drawer.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        appBar: buildAppBar(context),
        body: const Navbar(),
        drawer: CustomDrawer());
  }

  AppBar buildAppBar(context) {
    return AppBar(
        backgroundColor: Theme.of(context).canvasColor,
        foregroundColor: Theme.of(context).primaryColor,
        elevation: 0,
    );
  }
}
