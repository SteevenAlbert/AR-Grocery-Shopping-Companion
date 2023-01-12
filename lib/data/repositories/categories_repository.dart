import 'dart:convert';

import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CategoriesRepository {
  // Singleton pattern
  static final CategoriesRepository instance = CategoriesRepository._();

  List<CustomCategory> _categories = [];
  late final categoriesRepoProvider;
  late final categoriesListFutureProvider;

  CategoriesRepository._() {
    categoriesRepoProvider = Provider<CategoriesRepository>((ref) {
      return CategoriesRepository.instance;
    });

    categoriesListFutureProvider =
        Provider<Future<List<CustomCategory>>>((ref) {
      final categoriesRepo = ref.watch(categoriesRepoProvider);
      return categoriesRepo.fetchCategoriesList();
    });
  }

  Future<int> insert(CustomCategory customCategory) async {
    // TODO: implement insert customCategory
    throw UnimplementedError();
  }

  Future<List<CustomCategory>> fetchCategoriesList() async {
    // TODO: use the db_helper instead
    _categories = await queryDummyJson();
    return _categories;
  }

  Future<List<CustomCategory>> fetchCategoriesListByName() async {
    // TODO: implement this
    throw UnimplementedError();
  }

  Future<int> delete() async {
    // TODO: implement delete copmay
    throw UnimplementedError();
  }

  Future<int> deleteByName(name) async {
    // TODO: implement delete copmay by name
    throw UnimplementedError();
  }

  void reset() {
    // TODO: implement reset copmanies
    throw UnimplementedError();
  }

  List<CustomCategory> getCategories() {
    return _categories;
  }

  CustomCategory getCustomCategory(String id) {
    return _categories.firstWhere(
      (CustomCategory element) => element.id == id,
      orElse: () => CustomCategory.empty(),
    );
  }

  // DUMMY DATA --------------------------------------------------------------------------------------
  // Generate and return a list of categories from a .json file
  static Future<List<CustomCategory>> queryDummyJson() async {
    var input = await rootBundle.loadString("assets/dummy_data.json");
    var list = jsonDecode(input)["categories"];
    List<CustomCategory> categories = [];

    for (int i = 0; i < list.length; i++) {
      var product = CustomCategory.fromMap(list[i]);
      categories.add(product);
    }
    return categories;
  }
}
