import 'dart:convert';

import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ar_grocery_companion/data/helpers/db_helper.dart';
import 'package:firebase_database/firebase_database.dart';

class CompaniesRepository {
  // Singleton pattern
  static final CompaniesRepository instance = CompaniesRepository._();

  List<Company> _companies = [];
  late final companiesRepoProvider;
  late final companiesListFutureProvider;

  CompaniesRepository._() {
    companiesRepoProvider = Provider<CompaniesRepository>((ref) {
      return CompaniesRepository.instance;
    });

    companiesListFutureProvider = Provider<Future<List<Company>>>((ref) {
      final companiesRepo = ref.watch(companiesRepoProvider);
      return companiesRepo.fetchCompaniesList();
    });
  }

  Future<String> insert(Company company) async {
    FirebaseHelper.writeUnique('companies', company.toMap());
    return company.id;
  }

  Future<List<Company>> fetchCompaniesList() async {
    DataSnapshot? snapshot = await FirebaseHelper.read('companies');

    snapshot!.children.forEach((childSnapshot) {
      var props = childSnapshot.value as Map<String, dynamic>;
      _companies.add(Company.fromMap(props));
    });
    return _companies;
  }

  Future<List<Company>> fetchCompaniesListByName() async {
    // TODO: implement this
    throw UnimplementedError();
  }

  Future<int> delete() async {
    FirebaseHelper.delete('companies');
    return 1;
  }

  Future<int> deleteByName(name) async {
    // TODO: implement delete copmay by name
    throw UnimplementedError();
  }

  void reset() {
    // TODO: implement reset copmanies
    throw UnimplementedError();
  }

  List<Company> getCompanies() {
    return _companies;
  }

  Company getCompany(String id) {
    return _companies.firstWhere(
      (Company element) => element.id == id,
      orElse: () => Company.empty(),
    );
  }

  // DUMMY DATA --------------------------------------------------------------------------------------
  // Generate and return a list of companies from a .json file
  static Future<List<Company>> queryDummyJson() async {
    var input = await rootBundle.loadString("assets/dummy_data.json");
    var list = jsonDecode(input)["companies"];
    List<Company> companies = [];

    for (int i = 0; i < list.length; i++) {
      var product = Company.fromMap(list[i]);
      companies.add(product);
    }
    return companies;
  }
}
