import 'dart:convert';

import 'package:ar_grocery_companion/data/helpers/db_helper.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ar_grocery_companion/constants/dummy_data.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/cleaning_product.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/food_product.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/itemed_product.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/liquid_product.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/domain/models/product/product_base.dart';

class ProductsRepository {
  // Singleton pattern
  static final ProductsRepository instance = ProductsRepository._();

  List<Product> _products = [];
  late final productsRepoProvider;
  late final productsListFutureProvider;

  ProductsRepository._() {
    productsRepoProvider = Provider<ProductsRepository>((ref) {
      return ProductsRepository.instance;
    });

    productsListFutureProvider = Provider<Future<List<Product>>>((ref) {
      final productsRepo = ref.watch(productsRepoProvider);
      return productsRepo.fetchProductsList();
    });
  }

  Future<bool> insert(Product product) async {
    // User FirebaseHelper class here
    // Provide the path root using DBCollections class
    // eg. FirebaseHelper.writeUnique(DBCollections.products + "/" + CompanyName, data)

    bool inserted = await FirebaseHelper.instance
        .writeUnique('products', selectProductToMap(product));
    return inserted;
  }

  Future<List<Product>> fetchProductsList() async {
    DataSnapshot? snapshot = await FirebaseHelper.instance.read('products');

    snapshot!.children.forEach((childSnapshot) {
      var product =
          jsonDecode(jsonEncode(childSnapshot.value)) as Map<String, dynamic>;
      Product newProduct = selectProductFromMap(product);
      newProduct.id = childSnapshot.key!;
      _products.add(newProduct);
    });
    return _products;
  }

  Future<List<Product>> fetchProductsListByName() async {
    // TODO: implement this
    throw UnimplementedError();
  }

  List<Product> getProductsListByManufacturer(String id) {
    List<Product> tempList = [];
    _products.forEach((Product element) {
      element.manufacturer.id == id ? tempList.add(element) : "";
    });
    return tempList;
  }

  Future<String> deleteByID(id) async {
    FirebaseHelper.instance.delete('products/$id');
    return id;
  }

  Future<int> deleteByName(name) async {
    // TODO: implement delete product by name
    throw UnimplementedError();
  }

  void reset() {
    // TODO: implement reset products
    throw UnimplementedError();
  }

  List<Product> getProducts() {
    return _products;
  }

  Product getProduct(String id) {
    return _products.firstWhere(
      (Product element) => element.id == id,
      orElse: () => ProductBase.empty(),
    );
  }

  int getCount() {
    return _products.length;
  }

  // DUMMY DATA --------------------------------------------------------------------------------------
  // Generate and return dummy data
  static List<Product> generateDummyData() {
    List<Product> list = [];
    for (int i = 0; i < 20; i++) {
      Product product = dummyProduct(i);
      list.add(product);
    }
    return list;
  }

  // Generate and return a list of products from a .json file
  static Future<List<Product>> queryDummyJson() async {
    var input = await rootBundle.loadString("assets/dummy_data.json");
    var list = jsonDecode(input)["products"];
    List<Product> products = [];

    for (int i = 0; i < list.length; i++) {
      var product = ProductsRepository.selectProductFromMap(list[i]);
      products.add(product);
    }
    return products;
  }

  // DECORATOR PATTERN MAPPING -----------------------------------------------------------------------
  // Create product depending on its concrete class name
  static Product selectProductFromMap(Map map) {
    if (map.containsKey("product_base")) {
      return ProductBase.fromMap(map["product_base"]);
    } else if (map.containsKey("food_product")) {
      return FoodProduct.fromMap(map["food_product"]);
    } else if (map.containsKey("liquid_product")) {
      return LiquidProduct.fromMap(map["liquid_product"]);
    } else if (map.containsKey("cleaning_product")) {
      return CleaningProduct.fromMap(map["cleaning_product"]);
    } else if (map.containsKey("itemed_product")) {
      return ItemedProduct.fromMap(map["itemed_product"]);
    }
    return ProductBase.empty();
  }

  static Map<String, dynamic> selectProductToMap(Product product) {
    if (product is ProductBase) {
      ProductBase productBase = product;
      return {"product_base": productBase.toMap()};
    } else if (product is FoodProduct) {
      FoodProduct foodProduct = product;
      return {"food_product": foodProduct.toMap()};
    } else if (product is LiquidProduct) {
      LiquidProduct liquidProduct = product;
      return {"liquid_product": liquidProduct.toMap()};
    } else if (product is CleaningProduct) {
      CleaningProduct cleaningProduct = product;
      return {"cleaning_product": cleaningProduct.toMap()};
    } else if (product is ItemedProduct) {
      ItemedProduct itemedProduct = product;
      return {"itemed_product": itemedProduct.toMap()};
    }
    return ProductBase.empty().toMap();
  }
}
