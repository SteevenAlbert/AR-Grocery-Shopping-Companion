import 'dart:convert';
import 'package:ar_grocery_companion/constants/dummy_data.dart';
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
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  Future<int> insert(Product product) async{
    // TODO: implement insert product
    throw UnimplementedError();
  }

  Future<List<Product>> fetchProductsList() async{
    // TODO: use the db_helper instead
    _products = await queryDummyJson();
    return _products;
  }

  Future<List<Product>> fetchProductsListByName() async{
    // TODO: implement this
    throw UnimplementedError();
  }

  Future<int> delete() async{
    // TODO: implement delete product
    throw UnimplementedError();
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
    return _products
        .firstWhere((Product element) => element.id == id, orElse: () => ProductBase.empty(),);
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
    var list = jsonDecode(input);
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
    } else if (map.containsKey("machine_product")) {
      return MachineProduct.fromMap(map["machine_product"]);
    }
    return ProductBase.empty();
  }
}
