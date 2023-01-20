import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  AccountState createState() => AccountState();
}

class AccountState extends State<CustomDrawer> {
  Future<bool> isLoggedIn() async {
    return (await SessionManager().containsKey("isLoggedIn") != true ||
            await SessionManager().get("isLoggedIn") != true)
        ? false
        : true;
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder(
        future: isLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData) {
            return Drawer(
                child: Container(
              margin: EdgeInsets.only(left: 5, top: 0, right: 5, bottom: 25),
              child: Column(children: [
                DrawerHeader(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/icon/app_logo.png",
                      width: 100,
                    ),
                    Text("Grocar",
                        style: Theme.of(context).textTheme.titleSmall)
                  ],
                )),
                snapshot.data!
                    ? ListTile(
                        leading: Icon(Icons.account_circle),
                        title: Text("Personal Details"),
                        onTap: () {
                          context.push('/profile_page');
                        })
                    : SizedBox(height: 0, width: 0),
                ListTile(
                    leading: Icon(Icons.settings),
                    title: Text("Settings"),
                    onTap: () {
                      context.push('/settings_page');
                    }),
                Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: snapshot.data!
                          ? ListTile(
                              leading: Icon(Icons.logout),
                              title: Text("Sign Out"),
                              onTap: () async {
                                await SessionManager().destroy().then((_) {
                                  context.go('/authenticate');
                                });
                              })
                          : ListTile(
                              leading: Icon(Icons.login),
                              title: Text("Sign In"),
                              onTap: () async {
                                await SessionManager().destroy().then((_) {
                                  context.go('/authenticate');
                                });
                              })),
                ),
              ]),
            ));
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        });
  }
}
