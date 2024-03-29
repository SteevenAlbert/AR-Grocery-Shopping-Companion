// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';

abstract class Product {

  String id;

  DateTime createdAt;
  DateTime? updatedAt;

  String name;
  List<String> images;
  Company manufacturer;

  CustomCategory customCategory;

  Map<String, String>? prices;
  Map<String, String>? storesURLs;

  Map<String, dynamic> properties = {};

  Product({
    required this.id,
    required this.createdAt,
    this.updatedAt,
    required this.name,
    required this.images,
    required this.manufacturer,
    required this.customCategory,
    this.prices,
    this.storesURLs,
    required this.properties,
  });

  Map<String, dynamic> getProperties();
  
  @override
  String toString() {
    return 'Product(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, images: $images, manufacturer: $manufacturer, customCategory: $customCategory, prices: $prices, storesURLs: $storesURLs, properties: $properties)';
  }

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.createdAt == createdAt &&
      other.updatedAt == updatedAt &&
      other.name == name &&
      listEquals(other.images, images) &&
      other.manufacturer == manufacturer &&
      other.customCategory == customCategory &&
      mapEquals(other.prices, prices) &&
      mapEquals(other.storesURLs, storesURLs) &&
      mapEquals(other.properties, properties);
  }

  @override
  int get hashCode {
    return id.hashCode ^
      createdAt.hashCode ^
      updatedAt.hashCode ^
      name.hashCode ^
      images.hashCode ^
      manufacturer.hashCode ^
      customCategory.hashCode ^
      prices.hashCode ^
      storesURLs.hashCode ^
      properties.hashCode;
  }
}
