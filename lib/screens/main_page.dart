import 'package:ar_grocery_companion/components/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: buildAppBar(context),
      body: const Navbar(),
      drawer: Drawer(
        child: ListView(children: [
          ListTile(title: Text("Sign Out"), onTap: () => context.go('/')),
        ]),
      ),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
    );
  }
}
