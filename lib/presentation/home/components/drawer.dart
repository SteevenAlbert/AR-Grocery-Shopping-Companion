import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      margin: EdgeInsets.only(left: 5, top: 35, right: 5, bottom: 35),
      child: Column(mainAxisSize: MainAxisSize.max, children: [
        ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Personal Details"),
            onTap: () {
              context.push('/profile_page');
            }),
        ListTile(
            leading: Icon(Icons.apartment),
            title: Text("Manufacturers"),
            onTap: () {
              context.push('/companies_list_page');
            }),
        ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              context.push('/settings_page');
            }),
        ListTile(
            leading: Icon(Icons.admin_panel_settings),
            title: Text("Admin"),
            onTap: () {
              context.push('/admin_homepage');
            }),
        Expanded(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: ListTile(
                leading: Icon(Icons.logout),
                title: Text("Sign Out"),
                onTap: () async {
                  await SessionManager().destroy();
                  context.go('/authenticate');
                }),
          ),
        ),
      ]),
    ));
  }
}
