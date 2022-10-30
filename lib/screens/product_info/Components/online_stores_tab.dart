import 'package:ar_grocery_companion/screens/product_info/components/store_card.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/product.dart';

class OnlineStores extends StatelessWidget {
  final Product product;
  const OnlineStores({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 8.0),
      child: Column(
        children: [
          storeCard("assets/images/store_logos/amazon.png",
              product.prices['Amazon']!, product.URLs!["Amazon"]!),
          storeCard("assets/images/store_logos/noon.png",
              product.prices['Noon']!, product.URLs!["Noon"]!),
          storeCard("assets/images/store_logos/jumia.png",
              product.prices['Jumia']!, product.URLs!["Jumia"]!),
          storeCard("assets/images/store_logos/carrefour.png",
              product.prices['Carrefour']!, product.URLs!["Carrefour"]!),
        ],
      ),
    );
  }
}
