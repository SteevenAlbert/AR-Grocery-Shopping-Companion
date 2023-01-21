import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ar_grocery_companion/data/helpers/db_helper.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';

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

  Future<bool> insert(CustomCategory category) async {
    bool inserted = await FirebaseHelper.instance
        .writeUnique('categories', category.toMap());
    return inserted;
  }

  Future<String> update(CustomCategory category) async {
    Map<String, dynamic> cat = category.toMap();
    print(cat);
    FirebaseHelper.instance.update('categories/${cat['id']}', cat);
    return category.id;
  }

  Future<List<CustomCategory>> fetchCategoriesList() async {
    DataSnapshot? snapshot = await FirebaseHelper.instance.read('categories');

    snapshot!.children.forEach((childSnapshot) {
      var category =
          jsonDecode(jsonEncode(childSnapshot.value)) as Map<String, dynamic>;
      category["id"] = childSnapshot.key;
      _categories.add(CustomCategory.fromMap(category));
    });
    return _categories;
  }

  Future<void> deleteAll() async {
    FirebaseHelper.instance.delete('categories');
  }

  Future<String> deleteByID(id) async {
    FirebaseHelper.instance.delete('categories/$id');
    return id;
  }

  void reset() {
    deleteAll();
    // insert();
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
