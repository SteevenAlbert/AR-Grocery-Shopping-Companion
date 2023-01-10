// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ar_grocery_companion/models/product/product_decorator.dart';

class FoodProduct extends ProductDecorator {

  int? calories;
  String? servingSize;
  List<String>? ingredients;
  List<String>? allergyInfo;
  
  Map<String, Map<String, Object>>? nutrients;
  
  FoodProduct({
    product,
    this.calories,
    this.servingSize,
    this.ingredients,
    this.allergyInfo,
    this.nutrients,
  }):super(product: product);
  

  FoodProduct copyWith({
    int? calories,
    String? servingSize,
    List<String>? ingredients,
    List<String>? allergyInfo,
    Map<String, Map<String, Object>>? nutrients,
  }) {
    return FoodProduct(
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
    };
  }

  factory FoodProduct.fromMap(Map<String, dynamic> map) {
    return FoodProduct(
      calories: map['calories'] != null ? map['calories'] as int : null,
      servingSize: map['servingSize'] != null ? map['servingSize'] as String : null,
      ingredients: map['ingredients'] != null ? List<String>.from((map['ingredients'] as List<String>)) : null,
      allergyInfo: map['allergyInfo'] != null ? List<String>.from((map['allergyInfo'] as List<String>)) : null,
      nutrients: map['nutrients'] != null ? Map<String, Map<String, Object>>.from((map['nutrients'] as Map<String, Map<String, Object>>)) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodProduct.fromJson(String source) => FoodProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FoodProduct(calories: $calories, servingSize: $servingSize, ingredients: $ingredients, allergyInfo: $allergyInfo, nutrients: $nutrients)';
  }

  @override
  bool operator ==(covariant FoodProduct other) {
    if (identical(this, other)) return true;
  
    return 
      other.calories == calories &&
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
}
