// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/product/product_decorator.dart';

class MachineProduct extends ProductDecorator {
  
  String energyType;
  double energy;
  String unit;

  MachineProduct({
    required product,
    required this.energyType,
    required this.energy,
    required this.unit,
  }): super(product: product);

  MachineProduct copyWith({
    String? energyType,
    double? energy,
    String? unit,
  }) {
    return MachineProduct(
      product: product,
      energyType: energyType ?? this.energyType,
      energy: energy ?? this.energy,
      unit: unit ?? this.unit,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'energyType': energyType,
      'energy': energy,
      'unit': unit,
    };
  }

  factory MachineProduct.fromMap(Map<String, dynamic> map) {
    return MachineProduct(
      product: ProductsRepository.selectProductFromMap(map),
      energyType: map['energyType'] as String,
      energy: map['energy'] as double,
      unit: map['unit'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MachineProduct.fromJson(String source) => MachineProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MachineProduct(energyType: $energyType, energy: $energy, unit: $unit)';

  @override
  bool operator ==(covariant MachineProduct other) {
    if (identical(this, other)) return true;
  
    return 
      other.energyType == energyType &&
      other.energy == energy &&
      other.unit == unit;
  }

  @override
  int get hashCode => energyType.hashCode ^ energy.hashCode ^ unit.hashCode;

  @override
  Map<String, dynamic> getProperties() {
    Map<String, dynamic> updatedProperties = this.product.properties;
    updatedProperties.addAll({"Energy type": energyType, "Energy": "$energy $unit"});
    return updatedProperties;
  }
}
