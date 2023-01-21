// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/product/product_decorator.dart';

class FoodProduct extends ProductDecorator {
  int calories;
  String servingSize;
  List<String> ingredients;
  List<String> allergyInfo;

  Map<String, Map<String, dynamic>> nutrients;

  FoodProduct({
    required product,
    required this.calories,
    required this.servingSize,
    required this.ingredients,
    required this.allergyInfo,
    required this.nutrients,
  }) : super(product: product);

  FoodProduct copyWith({
    int? calories,
    String? servingSize,
    List<String>? ingredients,
    List<String>? allergyInfo,
    Map<String, Map<String, dynamic>>? nutrients,
  }) {
    return FoodProduct(
      product: product,
      calories: calories ?? this.calories,
      servingSize: servingSize ?? this.servingSize,
      ingredients: ingredients ?? this.ingredients,
      allergyInfo: allergyInfo ?? this.allergyInfo,
      nutrients: nutrients ?? this.nutrients,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'calories': calories,
      'servingSize': servingSize,
      'ingredients': ingredients,
      'allergyInfo': allergyInfo,
      'nutrients': nutrients,
      'product': ProductsRepository.selectProductToMap(product),
    };
  }

  factory FoodProduct.fromMap(Map<String, dynamic> map) {
    return FoodProduct(
      product: ProductsRepository.selectProductFromMap(map['product']),
      calories: map['calories'] as int,
      servingSize: map['servingSize'] as String,
      ingredients: List<String>.from((map['ingredients'] as List)),
      allergyInfo: List<String>.from((map['allergyInfo'] as List)),
      nutrients: {},
      // Map<String, Map<String, dynamic>>.from((map['nutrients'] as Map)),
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodProduct.fromJson(String source) =>
      FoodProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FoodProduct(calories: $calories, servingSize: $servingSize, ingredients: $ingredients, allergyInfo: $allergyInfo, nutrients: $nutrients)';
  }

  @override
  bool operator ==(covariant FoodProduct other) {
    if (identical(this, other)) return true;

    return other.calories == calories &&
        other.servingSize == servingSize &&
        listEquals(other.ingredients, ingredients) &&
        listEquals(other.allergyInfo, allergyInfo) &&
        mapEquals(other.nutrients, nutrients);
  }

  @override
  int get hashCode {
    return calories.hashCode ^
        servingSize.hashCode ^
        ingredients.hashCode ^
        allergyInfo.hashCode ^
        nutrients.hashCode;
  }

  @override
  Map<String, dynamic> getProperties() {
    Map<String, dynamic> updatedProperties = this.product.properties;
    updatedProperties.addAll({
      "Ingredients": ingredients.join(", "),
      "Allergy Information": allergyInfo.join(", ")
    });
    return updatedProperties;
  }
}
