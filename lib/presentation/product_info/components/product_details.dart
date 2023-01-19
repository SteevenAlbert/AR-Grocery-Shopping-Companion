import 'package:flutter/material.dart';

import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/presentation/product_info/components/nutrition_table.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Product product;

  ProductDetails({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> props = product.getProperties();
    return ListView.builder(
      itemCount: (props.length + 1),
      itemBuilder: ((context, index) {
        
        if (index < props.length) {
          String key = props.keys.elementAt(index);
          return ListTile(
            title: Center(child: Text("$key")),
            subtitle: Center(child: Text("${props[key]}")),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: nutrientWidget(nutrientData: {
              "FAT": {"amount": 7, "unit": "g"},
              "SATFAT": {"amount": 5, "unit": "g"},
              "TRANSFAT": {"amount": 2, "unit": "g"},
              "CHOLE": {"amount": 67.51, "unit": "g"},
              "NA": {"amount": 67.51, "unit": "g"},
              "CHOCDF": {"amount": 67.51, "unit": "g"},
              "FIBTG": {"amount": 67.51, "unit": "g"},
              "SUGAR": {"amount": 67.51, "unit": "g"},
              "PROCNT": {"amount": 67.51, "unit": "g"},
            }, calories: 200, servingSize: "2 bars"),
          );
        }
      }),
    );
  }
}
