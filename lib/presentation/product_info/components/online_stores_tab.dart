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
            fetchJumiaPrice(product),
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
                  storeCard(context, "assets/images/store_logos/noon.png",
                      product.prices!['Noon']!, product.storesURLs!["Noon"]!),
                  storeCard(
                      context,
                      "assets/images/store_logos/jumia.png",
                      snapshot.data![1].prices['Jumia'],
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
            return const CircularProgressIndicator();
          }),
    );
  }
}
