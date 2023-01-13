import 'dart:async';

import 'package:ar_grocery_companion/presentation/components/nav_bar.dart';
import 'package:ar_grocery_companion/utils.dart';
import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/presentation/home/components/drawer.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../services/connection_checker.dart';
import 'noInternetPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  late StreamSubscription _connectionChangeStream;
  bool _hasConnection = false;

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
          backgroundColor: Theme.of(context).canvasColor,
          appBar: buildAppBar(context: context),
          body: const Navbar(),
          drawer: CustomDrawer());
    }
  }
}
