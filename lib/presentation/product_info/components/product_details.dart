import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> props = product.getProperties();
    return ListView.builder(
      itemCount: props.length,
      itemBuilder: ((context, index) {
        String key = props.keys.elementAt(index);
        return ListTile(
          title: Center(child: Text("$key")),
          subtitle: Center(child: Text("${props[key]}")),
        );
      }),
    );
  }
}
