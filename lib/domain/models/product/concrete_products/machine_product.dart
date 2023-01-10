// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ar_grocery_companion/domain/models/product/product_decorator.dart';

class MachineProduct extends ProductDecorator {
  
  double watts;
  double weight;

  MachineProduct({
    product,
    required this.watts,
    required this.weight,
  }): super(product: product);

  MachineProduct copyWith({
    double? watts,
    double? weight,
  }) {
    return MachineProduct(
      watts: watts ?? this.watts,
      weight: weight ?? this.weight,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'watts': watts,
      'weight': weight,
    };
  }

  factory MachineProduct.fromMap(Map<String, dynamic> map) {
    return MachineProduct(
      watts: map['watts'] as double,
      weight: map['weight'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory MachineProduct.fromJson(String source) => MachineProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MachineProduct(watts: $watts, weight: $weight)';

  @override
  bool operator ==(covariant MachineProduct other) {
    if (identical(this, other)) return true;
  
    return 
      other.watts == watts &&
      other.weight == weight;
  }

  @override
  int get hashCode => watts.hashCode ^ weight.hashCode;
}
