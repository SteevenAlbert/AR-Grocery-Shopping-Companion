import 'package:flutter/material.dart';
import 'components/fav_prod_list.dart';

class FavProductsPage extends StatelessWidget {
  const FavProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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
        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
        FavProductsList(),
      ],
    ));
  }
}
