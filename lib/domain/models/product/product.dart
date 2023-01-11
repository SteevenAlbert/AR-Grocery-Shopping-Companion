// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ar_grocery_companion/domain/models/product/concrete_products/cleaning_product.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/food_product.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/itemed_product.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/machine_product.dart';
import 'package:ar_grocery_companion/domain/models/product/product_base.dart';
import 'package:flutter/foundation.dart';

import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';

import 'concrete_products/liquid_product.dart';

abstract class Product {

  int id;

  String name;
  String imagePath;
  Company manufacturer;

  CustomCategory customCategory;

  Map<String, String>? prices;
  Map<String, String>? storesURLs;

  Map<String, dynamic> properties = {};

  Product({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.manufacturer,
    required this.customCategory,
    this.prices,
    this.storesURLs,
    required this.properties,
  });
  
  Map<String, dynamic> getProperties();

  @override
  String toString() {
    return 'Product(id: $id, name: $name, imagePath: $imagePath, manufacturer: $manufacturer, customCategory: $customCategory, prices: $prices, storesURLs: $storesURLs, properties: $properties)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.imagePath == imagePath &&
      other.manufacturer == manufacturer &&
      other.customCategory == customCategory &&
      mapEquals(other.prices, prices) &&
      mapEquals(other.storesURLs, storesURLs) &&
      mapEquals(other.properties, properties);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      imagePath.hashCode ^
      manufacturer.hashCode ^
      customCategory.hashCode ^
      prices.hashCode ^
      storesURLs.hashCode ^
      properties.hashCode;
  }
}
