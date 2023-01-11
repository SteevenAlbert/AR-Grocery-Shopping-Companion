import 'package:ar_grocery_companion/domain/models/product/product.dart';

class ProductBase extends Product {
  ProductBase({
    required id,
    required name,
    required imagePath,
    required manufacturer,
    required customCategory,
    prices,
    storesURLs
  }) : super(
            id: id,
            name: name,
            imagePath: imagePath,
            manufacturer: manufacturer,
            customCategory: customCategory,
            prices: prices,
            storesURLs: storesURLs,
            properties: {});

  @override
  Map<String, dynamic> getProperties() {
    return properties;
  }
}
