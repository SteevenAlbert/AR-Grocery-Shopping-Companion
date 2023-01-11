import 'package:ar_grocery_companion/domain/models/product/product.dart';

abstract class ProductDecorator extends Product {
  Product product;

  ProductDecorator({
    required this.product,
  }) : super(
            id: product.id,
            name: product.name,
            images: product.images,
            manufacturer: product.manufacturer,
            customCategory: product.customCategory,
            prices: product.prices,
            storesURLs: product.storesURLs,
            properties: product.getProperties());

  @override
  String toString() => 'ProductDecorator(product: $product)';

  @override
  bool operator ==(covariant ProductDecorator other) {
    if (identical(this, other)) return true;

    return other.product == product;
  }

  @override
  int get hashCode => product.hashCode;

  @override
  Map<String, dynamic> getProperties() {
    return product.getProperties();
  }
}
