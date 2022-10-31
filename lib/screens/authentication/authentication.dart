import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/screens/authentication/log_in.dart';
import 'package:ar_grocery_companion/screens/authentication/register.dart';
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
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
    );
  }

  List<Widget> _buildScreens() {
    return [
      const LogInScreen(),
      const RegisterScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.login),
        title: ('Log In'),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.account_box_rounded),
        title: ('Register'),
      ),
    ];
  }
}
