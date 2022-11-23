import 'package:flutter/material.dart';
import 'components/fav_prod_list.dart';

class FavProductsPage extends StatelessWidget {
  const FavProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          title: Text("Favourite Items",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        ),
        body: FavProductsList());
  }
}
