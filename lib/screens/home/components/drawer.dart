import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter_session_manager/flutter_session_manager.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
      // Text('Top'),
      Expanded(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ListTile(
              leading: Icon(Icons.logout),
              title: Text("Sign Out"),
              onTap: () => context.go('/')),
        ),
      ),
    ]));
  }
}
