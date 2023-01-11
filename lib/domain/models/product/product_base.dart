import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';

class ProductBase extends Product {
  ProductBase(
      {required id,
      required name,
      required imagePath,
      required manufacturer,
      required customCategory,
      prices,
      storesURLs})
      : super(
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

  factory ProductBase.empty() {
    return ProductBase(
        id: "-1",
        name: "Nan",
        imagePath: "",
        manufacturer: Company(id: "-1", name: ""),
        customCategory: CustomCategory(id: "-1", name: ""));
  }
}
