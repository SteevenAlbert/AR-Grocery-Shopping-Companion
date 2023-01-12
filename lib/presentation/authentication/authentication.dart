// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/presentation/components/authentication/background2.dart';
import 'package:ar_grocery_companion/presentation/authentication/log_in.dart';
import 'package:ar_grocery_companion/presentation/authentication/register.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  LogInPageState createState() => LogInPageState();
}

class LogInPageState extends State<AuthenticationPage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Background2(),
        //----- Card Container -----//
        Container(
          padding: EdgeInsets.only(left: 25, top: 125, right: 25, bottom: 0),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                // color: Colors.grey.withOpacity(0.25),
                color: Theme.of(context).canvasColor.withOpacity(0.25),
                spreadRadius: 200,
                blurRadius: 0,
                offset: Offset(-30, -100),
              ),
            ],
          ),
          child: Container(
              padding: EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60),
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0)),
              ),
              child:
                  //----- Nav Bar -----//
                  Container(
                margin: EdgeInsets.only(left: 3, right: 3, top: 3),
                color: Theme.of(context).canvasColor,
                child: PersistentTabView(
                  backgroundColor: Theme.of(context).canvasColor,
                  context,
                  controller: _controller,
                  screens: _buildScreens(),
                  items: _navBarsItems(context),
                  navBarStyle: NavBarStyle.style14,
                  // navBarStyle: NavBarStyle.style3,
                  // navBarStyle: NavBarStyle.style6,
                  // navBarStyle: NavBarStyle.style8,
                ),
              )),
        ),
      ]),
    );
  }
}

//-----  -----//
List<Widget> _buildScreens() {
  return [
    const LogInScreen(),
    const RegisterScreen(),
  ];
}

//----- Nav Bar Items -----//
List<PersistentBottomNavBarItem> _navBarsItems(context) {
  return [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.login),
      title: ('Log In'),
      activeColorPrimary: Theme.of(context).primaryColor,
      inactiveColorPrimary: Theme.of(context).disabledColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.account_box_rounded),
      title: ('Register'),
      activeColorPrimary: Theme.of(context).primaryColor,
      inactiveColorPrimary: Theme.of(context).disabledColor,
    ),
  ];
}
