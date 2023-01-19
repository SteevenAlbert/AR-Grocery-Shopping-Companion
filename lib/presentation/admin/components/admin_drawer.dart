import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:go_router/go_router.dart';

class AdminDrawer extends StatefulWidget {
  const AdminDrawer({super.key, required this.page});

  final PageController page;

  @override
  State<AdminDrawer> createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icon/app_logo.png", width: 100,),
              Text("Grocar", style: Theme.of(context).textTheme.titleSmall)
            ],
          )),
          ListTile(
              leading: Icon(Icons.dashboard),
              title: Text("Dashboard"),
              onTap: () {
                widget.page.jumpToPage(0);
              }),
          ListTile(
              leading: Icon(Icons.supervised_user_circle),
              title: Text("Users"),
              onTap: () {
                widget.page.jumpToPage(0);
              }),
          ListTile(
              leading: Icon(Icons.bakery_dining),
              title: Text("Products"),
              onTap: () {
                widget.page.jumpToPage(1);
              }),
          ListTile(
              leading: Icon(Icons.discount),
              title: Text("Categories"),
              onTap: () {
                widget.page.jumpToPage(2);
              }),
          ListTile(
              leading: Icon(Icons.bakery_dining),
              title: Text("Manufacturers"),
              onTap: () {
                widget.page.jumpToPage(3);
              }),
          ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                widget.page.jumpToPage(4);
              }),
        ],
      ),
    );
  }
}
