import 'package:flutter/material.dart';
import 'components/fav_prod_list.dart';
import 'package:ar_grocery_companion/components/header.dart';

class FavProductsPage extends StatelessWidget {
  const FavProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Favourite Products"),
        ),
        body: FavProductsList());
  }
}
