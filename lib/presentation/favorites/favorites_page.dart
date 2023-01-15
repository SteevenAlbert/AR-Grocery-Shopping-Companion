import 'package:flutter/material.dart';
import 'components/fav_prod_list.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class FavProductsPage extends StatelessWidget {
  final PersistentTabController controller;
  FavProductsPage({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("My items",
                    style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600))),
          ),
          FavProductsList(
              height: MediaQuery.of(context).size.height,
              controller: controller),
        ],
      ),
    ));
  }
}
