import 'package:ar_grocery_companion/components/nav_bar.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: buildAppBar(context),
      body: const Navbar(),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Colors.white,),
        onPressed: () {},
      ),
    );
  }
}