import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';

class ProductBase extends Product {
  ProductBase(
      {required id,
      required createdAt,
      updatedAt,
      required name,
      required images,
      required manufacturer,
      required customCategory,
      prices,
      storesURLs})
      : super(
            id: id,
            createdAt: createdAt,
            updatedAt: updatedAt,
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
        createdAt: DateTime.now(),
        name: "Nan",
        images: [""],
        manufacturer: Company(id: "-1", name: ""),
        customCategory: CustomCategory(id: "-1", name: ""));
  }

  factory ProductBase.fromMap(Map<String, dynamic> map) {
    return ProductBase(
      id: map["id"],
      createdAt: DateTime.now(),
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'id': id,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt?.millisecondsSinceEpoch,
      'name': name,
      'images': images,
      'manufacturer': manufacturer.toMap(),
      'customCategory': customCategory.toMap(),
      'prices': prices,
      'storeURLs': storesURLs,
    };
  }
}
