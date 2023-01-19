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
      child: Padding(
        padding: const EdgeInsets.only(left: 5, top: 0, right: 5, bottom: 25),
        child: Column(
          children: [
            DrawerHeader(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/icon/app_logo.png",
                  width: 100,
                ),
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
                leading: Icon(Icons.account_circle),
                title: Text("Personal Details"),
                onTap: () {
                  context.push('/profile_page');
                }),
            ListTile(
                leading: Icon(Icons.person_add_alt),
                title: Text("Add New Admin"),
                onTap: () {
                  context.push('/add_admin');
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
                leading: Icon(Icons.apartment),
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
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: (SessionManager().containsKey("isLoggedIn") != true ||
                        SessionManager().get("isLoggedIn") != true)
                    ? ListTile(
                        leading: Icon(Icons.login),
                        title: Text("Sign In"),
                        onTap: () async {
                          context.go('/authenticate');
                        })
                    : ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("Sign Out"),
                        onTap: () async {
                          await SessionManager().destroy();
                          context.go('/authenticate');
                        }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
