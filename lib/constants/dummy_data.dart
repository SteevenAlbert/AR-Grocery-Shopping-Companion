import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/food_product.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/liquid_product.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/domain/models/product/product_base.dart';
import 'package:ar_grocery_companion/domain/models/user/app_user.dart';

Product dummyProduct(i) {
  ProductBase productBase = ProductBase(
      id: "$i",
      name: "name $i",
      images: ["assets/images/milk-1.png"],
      manufacturer: Company(id: "$i", name: "company $i"),
      customCategory: CustomCategory(id: "$i", name: "Cat $i"));
  LiquidProduct liquidProduct =
      LiquidProduct(product: productBase, volume: 100.0, unit: "mL");
  FoodProduct foodProduct = FoodProduct(
      product: liquidProduct,
      calories: 200,
      servingSize: "$i 00",
      ingredients: [
        "Milk, other ingredient, other too"
      ],
      allergyInfo: [
        "Lactose",
        "Glucose"
      ],
      nutrients: {
        "FAT": {"amount": 200, "unit": "g"}
      });
  return foodProduct;
}
