import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'package:ar_grocery_companion/presentation/authentication/log_in.dart';
import 'package:ar_grocery_companion/presentation/authentication/register.dart';
import 'package:ar_grocery_companion/presentation/components/backgrounds/background2.dart';

import '../../services/connection_checker.dart';
import '../no_internet_page.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  LogInPageState createState() => LogInPageState();
}

class LogInPageState extends State<AuthenticationPage> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  late StreamSubscription _connectionChangeStream;
  bool _hasConnection = true;

  @override
  initState() {
    super.initState();
    _connectionChangeStream =
        connectionStatus.connectionChange.listen(connectionChanged);
    print(connectionStatus.hasConnection);
  }

  void connectionChanged(dynamic hasConnection) {
    setState(() {
      _hasConnection = !hasConnection;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (connectionStatus.hasConnection == false && kIsWeb != true) {
      return noInternetScreen();
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(fit: StackFit.expand, children: [
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
                padding:
                    EdgeInsets.only(top: 20, bottom: 0, left: 20, right: 20),
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
                  margin: EdgeInsets.only(left: 3, right: 3, top: 4),
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
}

//-----  -----//
List<Widget> _buildScreens() {
  return [
    const LogInScreen(),
    const RegisterScreen(type: 'customer'),
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
