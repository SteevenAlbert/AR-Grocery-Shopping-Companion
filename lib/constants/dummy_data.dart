import 'dart:convert';
import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/food_product.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/liquid_product.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/domain/models/product/product_base.dart';
import 'package:flutter/services.dart';

Product dummyProduct(i) {
  ProductBase productBase = ProductBase(
      id: "$i",
      createdAt: DateTime.now(),
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

  // DUMMY DATA --------------------------------------------------------------------------------------
  // Generate and return dummy data
  List<Product> generateDummyData() {
    List<Product> list = [];
    for (int i = 0; i < 20; i++) {
      Product product = dummyProduct(i);
      list.add(product);
    }
    return list;
  }

  // Generate and return a list of products from a .json file
  Future<List<Product>> queryDummyJson() async {
    var input = await rootBundle.loadString("assets/dummy_data.json");
    var list = jsonDecode(input)["products"];
    List<Product> products = [];

    for (int i = 0; i < list.length; i++) {
      var product = ProductsRepository.selectProductFromMap(list[i]);
      products.add(product);
    }
    return products;
  }