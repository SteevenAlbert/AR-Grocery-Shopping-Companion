import 'dart:convert';
import 'dart:io';

import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/cleaning_product.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/food_product.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/itemed_product.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/liquid_product.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/machine_product.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/domain/models/product/product_base.dart';
import 'package:flutter/services.dart';

class ProductsRepository {
  static List<Product> queryAllDummyData() {
    List<Product> list = [];
    for (int i = 0; i < 20; i++) {
      ProductBase productBase = ProductBase(
          id: "$i",
          name: "name $i",
          imagePath: "assets/images/milk-1.png",
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

      list.add(foodProduct);
    }

    return list;
  }

  static Product retrieveProduct(String id) {
    return queryAllDummyData()
        .firstWhere((Product element) => element.id == id);
  }

  static Future<List<Product>> queryDummyJson() async {
    var input = await rootBundle.loadString("assets/dummy_data.json");
    var list = jsonDecode(input);

    List<Product> products = [];

    for(int i = 0; i<list.length; i++){
      print(list[i]);
      var product = ProductsRepository.selectProductFromMap(list[i]);
      products.add(product);
    }

    return products;
  }

  static Product selectProductFromMap(Map map){
    if (map.containsKey("product_base")){
      var currMap = map["product_base"];
      return ProductBase(id: currMap["id"], name: currMap["name"], imagePath: currMap["imagePath"], manufacturer: Company.fromMap(currMap["manufacturer"]), customCategory: CustomCategory.fromMap(currMap["customCategory"]));
    }
    else if (map.containsKey("food_product")){
      var currMap = map["food_product"];
      return FoodProduct.fromMap(currMap);
    }
    else if (map.containsKey("liquid_product")){
      var currMap = map["liquid_product"];
      return LiquidProduct.fromMap(currMap);
    }
    else if (map.containsKey("cleaning_product")){
      var currMap = map["cleaning_product"];
      return CleaningProduct.fromMap(currMap);
    }
    else if (map.containsKey("itemed_product")){
      var currMap = map["itemed_product"];
      return ItemedProduct.fromMap(currMap);
    }
    else if (map.containsKey("machine_product")){
      var currMap = map["machine_product"];
      return MachineProduct.fromMap(currMap);
    }

    return ProductBase.empty();
     
  }
}
