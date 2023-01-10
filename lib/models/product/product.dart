// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:ar_grocery_companion/models/product/product_category.dart';
import 'package:ar_grocery_companion/models/company.dart';

abstract class Product {

  int? id;

  String name;
  String imagePath;
  Company manufacturer;

  Map<String, String>? prices;
  Map<String, String>? storesURLs;

  ProductCategory? category;

  Product({
    this.id,
    required this.name,
    required this.imagePath,
    required this.manufacturer,
    this.prices,
    this.storesURLs,
  });

  @override
  String toString() {
    return 'Product(id: $id, name: $name, imagePath: $imagePath, manufacturer: $manufacturer, prices: $prices, storesURLs: $storesURLs)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.imagePath == imagePath &&
      other.manufacturer == manufacturer &&
      mapEquals(other.prices, prices) &&
      mapEquals(other.storesURLs, storesURLs);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      imagePath.hashCode ^
      manufacturer.hashCode ^
      prices.hashCode ^
      storesURLs.hashCode;
  }

  // Temporary
  static List<Product> all = [];
}