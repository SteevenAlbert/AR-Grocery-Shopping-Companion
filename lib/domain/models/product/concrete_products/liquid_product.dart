// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/domain/models/product/product_decorator.dart';

class LiquidProduct extends ProductDecorator {
  double volume;
  String unit;

  LiquidProduct({
    required product,
    required this.volume,
    required this.unit,
  }):super(product: product);
  
  LiquidProduct copyWith({
    double? volume,
    String? unit,
  }) {
    return LiquidProduct(
      product: product,
      volume: volume ?? this.volume,
      unit: unit ?? this.unit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'volume': volume,
      'unit': unit,
    };
  }

  factory LiquidProduct.fromMap(Map<String, dynamic> map) {
    return LiquidProduct(
      // TODO: implement product mapping
      product: Product,
      volume: map['volume'] as double,
      unit: map['unit'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LiquidProduct.fromJson(String source) => LiquidProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LiquidProduct(volume: $volume, unit: $unit)';

  @override
  bool operator ==(covariant LiquidProduct other) {
    if (identical(this, other)) return true;
  
    return 
      other.volume == volume &&
      other.unit == unit;
  }

  @override
  int get hashCode => volume.hashCode ^ unit.hashCode;

  @override
  Map<String, dynamic> getProperties() {
    Map<String, dynamic> updatedProperties = this.product.properties;
    updatedProperties.addAll({"Volume": "$volume $unit"});
    return updatedProperties;
  }
}
