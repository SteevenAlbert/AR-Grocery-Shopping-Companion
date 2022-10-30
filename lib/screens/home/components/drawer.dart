import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      ListTile(title: Text("Sign Out"), onTap: () => context.go('/')),
    ]));
  }
}
