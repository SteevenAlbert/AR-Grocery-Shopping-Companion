// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:ar_grocery_companion/domain/models/product/product_decorator.dart';

class CleaningProduct extends ProductDecorator {
  
  List<String> materialCleaned;

  CleaningProduct({
    product,
    required this.materialCleaned,
  }): super(product: product);
  
  CleaningProduct copyWith({
    List<String>? materialCleaned,
  }) {
    return CleaningProduct(
      materialCleaned: materialCleaned ?? this.materialCleaned,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'materialCleaned': materialCleaned,
    };
  }

  factory CleaningProduct.fromMap(Map<String, dynamic> map) {
    return CleaningProduct(
      materialCleaned: List<String>.from((map['materialCleaned'] as List<String>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory CleaningProduct.fromJson(String source) => CleaningProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CleaningProduct(materialCleaned: $materialCleaned)';

  @override
  bool operator ==(covariant CleaningProduct other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.materialCleaned, materialCleaned);
  }

  @override
  int get hashCode => materialCleaned.hashCode;
}
