import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';

class ProductBase extends Product {
  ProductBase(
      {required id,
      required name,
      required images,
      required manufacturer,
      required customCategory,
      prices,
      storesURLs})
      : super(
            id: id,
            name: name,
            images: images,
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
        images: [""],
        manufacturer: Company(id: "-1", name: ""),
        customCategory: CustomCategory(id: "-1", name: ""));
  }

  factory ProductBase.fromMap(Map<String, dynamic> map) {
    return ProductBase(
      id: map["id"],
      name: map["name"],
      images: List<String>.from(map["images"] as List),
      manufacturer: Company.fromMap(map["manufacturer"]),
      customCategory: CustomCategory.fromMap(
        map["customCategory"],
      ),
      prices: Map<String, String>.from((map['prices'] as Map)),
      storesURLs: Map<String, String>.from((map['storesURLs'] as Map)),
    );
  }
}
