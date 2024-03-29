import 'package:flutter/material.dart';

import 'package:ar_grocery_companion/presentation/product_info/components/store_card.dart';
import 'package:ar_grocery_companion/services/amazonapi.dart';
import 'package:ar_grocery_companion/services/custom_web_scrapper.dart';

import '../../../domain/models/product/product.dart';
import '../../../services/lulu_web_scrapper.dart';

class OnlineStores extends StatelessWidget {
  final Product product;
  const OnlineStores({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 8.0),
      child: FutureBuilder(
          future: Future.wait([
            fetchAmazonPriceDummy(product),
            fetchSpinneysPrice(product),
            fetchLuluPrice(product),
          ]),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              return ListView(
                children: [
                  storeCard(
                      context,
                      "assets/images/store_logos/amazon.png",
                      snapshot.data?[0] ?? "Not Available",
                      product.storesURLs?["Amazon"] ?? ""),
                  storeCard(
                      context,
                      "assets/images/store_logos/spinneys.png",
                      snapshot.data?[1] ?? "Not Available",
                      product.storesURLs?["Spinneys"] ?? "Not Available"),
                  storeCard(
                      context,
                      "assets/images/store_logos/lulu.png",
                      snapshot.data?[2] ?? "Not Available",
                      product.storesURLs?["Lulu"] ?? ""),
                  storeCard(
                      context,
                      "assets/images/store_logos/carrefour.png",
                      product.prices?['Lulu'] ?? " ",
                      product.storesURLs?["Lulu"] ?? ""),
                  // storeCard(
                  //     context,
                  //     "assets/images/store_logos/jumia.png",
                  //     product.prices?['Carrefour'] ?? "Not Available",
                  //     product.storesURLs?["Jumia"] ?? ""),
                ],
              );
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Text('${snapshot.error}');
            }
            return Center(
              child: Container(
                  width: 100, height: 100, child: CircularProgressIndicator()),
            );
          }),
    );
  }
}
