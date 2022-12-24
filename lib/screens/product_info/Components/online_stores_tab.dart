import 'package:ar_grocery_companion/screens/product_info/components/store_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/amazonapi.dart';
import '../../../models/product.dart';

class OnlineStores extends StatelessWidget {
  final Product product;
  const OnlineStores({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 8.0),
      child: FutureBuilder<Product>(
          future: fetchPrice(product),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  storeCard(
                      context,
                      "assets/images/store_logos/amazon.png",
                      snapshot.data!.prices['Amazon']!,
                      product.URLs!["Amazon"]!),
                  storeCard(context, "assets/images/store_logos/noon.png",
                      product.prices['Noon']!, product.URLs!["Noon"]!),
                  storeCard(context, "assets/images/store_logos/jumia.png",
                      product.prices['Jumia']!, product.URLs!["Jumia"]!),
                  storeCard(
                      context,
                      "assets/images/store_logos/carrefour.png",
                      product.prices['Carrefour']!,
                      product.URLs!["Carrefour"]!),
                ],
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
