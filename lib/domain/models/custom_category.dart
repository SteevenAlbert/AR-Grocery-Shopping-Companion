// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CustomCategory {
  String id;
  String name;
  String? imagePath;
  List<String>? products;
  CustomCategory({
    required this.id,
    required this.name,
    this.imagePath,
    this.products,
  });

  CustomCategory copyWith({
    String? id,
    String? name,
    String? imagePath,
    List<String>? products,
  }) {
    return CustomCategory(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      products: products ?? this.products,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'products': products,
    };
  }

  factory CustomCategory.fromMap(Map<String, dynamic> map) {
    return CustomCategory(
      id: map['id'] as String,
      name: map['name'] as String,
      imagePath: map['imagePath'] != null ? map['imagePath'] as String : null,
      products: map['products'] != null
          ? List<String>.from((map['products'] as List<String>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomCategory.fromJson(String source) =>
      CustomCategory.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomCategory(id: $id, name: $name, imagePath: $imagePath, products: $products)';
  }

  @override
  bool operator ==(covariant CustomCategory other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.imagePath == imagePath &&
        listEquals(other.products, products);
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ imagePath.hashCode ^ products.hashCode;
  }

  // TODO: remove all list
  static List<CustomCategory> all = [];

  factory CustomCategory.empty() {
    return CustomCategory(id: "-1", name: "Nan");
  }
}
