import 'package:ar_grocery_companion/presentation/admin/home/admin_home_page.dart';
import 'package:ar_grocery_companion/presentation/scan/scan_intro_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:ar_grocery_companion/presentation/home/home_page.dart';
import 'package:ar_grocery_companion/presentation/favorites/favorites_page.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: const [
        HomePage(),
        ScanPage(),
        FavProductsPage(),
      ],
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style1,
      backgroundColor: Theme.of(context).canvasColor,
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Home"),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).disabledColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.camera),
        title: ("Scan"),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).disabledColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite),
        title: ("Favorites"),
        activeColorPrimary: Theme.of(context).primaryColor,
        inactiveColorPrimary: Theme.of(context).disabledColor,
      ),
    ];
  }
}
