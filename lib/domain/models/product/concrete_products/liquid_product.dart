// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ar_grocery_companion/domain/models/product/product_decorator.dart';

class LiquidProduct extends ProductDecorator {
  double litres;
  LiquidProduct({
    product,
    required this.litres,
  }) : super(product: product);

  LiquidProduct copyWith({
    double? litres,
  }) {
    return LiquidProduct(
      litres: litres ?? this.litres,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'litres': litres,
    };
  }

  factory LiquidProduct.fromMap(Map<String, dynamic> map) {
    return LiquidProduct(
      litres: map['litres'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory LiquidProduct.fromJson(String source) =>
      LiquidProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LiquidProduct(litres: $litres)';

  @override
  bool operator ==(covariant LiquidProduct other) {
    if (identical(this, other)) return true;

    return other.litres == litres;
  }

  @override
  int get hashCode => litres.hashCode;
}
