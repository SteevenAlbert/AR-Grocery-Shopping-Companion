import 'package:ar_grocery_companion/presentation/product_info/components/store_card.dart';
import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/services/amazonapi.dart';
import 'package:ar_grocery_companion/services/custom_web_scrapper.dart';
import '../../../domain/models/product/product.dart';

class OnlineStores extends StatelessWidget {
  final Product product;
  const OnlineStores({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 8.0),
      child: FutureBuilder(
          future: Future.wait([
            fetchAmazonPrice(product),
            fetchSpinneysPrice(product),
          ]),
          builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [
                  storeCard(
                      context,
                      "assets/images/store_logos/amazon.png",
                      snapshot.data![0].prices['Amazon'],
                      product.storesURLs!["Amazon"]!),
                  storeCard(
                      context,
                      "assets/images/store_logos/spinneys.png",
                      snapshot.data![1]?.prices['Spinneys']!,
                      product.storesURLs!["Spinneys"]!),
                  storeCard(
                      context,
                      "assets/images/store_logos/jumia.png",
                      product.prices!['Carrefour']!,
                      product.storesURLs!["Jumia"]!),
                  storeCard(
                      context,
                      "assets/images/store_logos/carrefour.png",
                      product.prices!['Carrefour']!,
                      product.storesURLs!["Carrefour"]!),
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
