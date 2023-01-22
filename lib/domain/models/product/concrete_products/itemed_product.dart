// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/product/product_decorator.dart';

class ItemedProduct extends ProductDecorator {
  int noOfItems;
  ItemedProduct({
    required product,
    required this.noOfItems,
  }) : super(product: product);

  ItemedProduct copyWith({
    int? noOfItems,
  }) {
    return ItemedProduct(
      product: product,
      noOfItems: noOfItems ?? this.noOfItems,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noOfItems': noOfItems,
      'product' : ProductsRepository.selectProductToMap(product),
    };
  }

  factory ItemedProduct.fromMap(Map<String, dynamic> map) {
    return ItemedProduct(
      product: ProductsRepository.selectProductFromMap(map['product']),
      noOfItems: map['noOfItems'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemedProduct.fromJson(String source) =>
      ItemedProduct.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ItemedProduct(noOfItems: $noOfItems)';

  @override
  bool operator ==(covariant ItemedProduct other) {
    if (identical(this, other)) return true;

    return other.noOfItems == noOfItems;
  }

  @override
  int get hashCode => noOfItems.hashCode;

  @override
  Map<String, dynamic> getProperties() {
    Map<String, dynamic> updatedProperties = this.product.properties;
    updatedProperties.addAll({"Number of items": noOfItems.toString()});
    return updatedProperties;
  }
}
