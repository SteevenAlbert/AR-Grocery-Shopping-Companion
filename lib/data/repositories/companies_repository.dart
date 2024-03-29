import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ar_grocery_companion/data/helpers/db_helper.dart';
import 'package:ar_grocery_companion/domain/models/company.dart';

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

  Future<bool> insert(Company company) async {
    bool inserted =
        await FirebaseHelper.instance.writeUnique('companies', company.toMap());
    return inserted;
  }

  Future<bool> insertProduct(String companyID, String productID) async {
    bool inserted = await FirebaseHelper.instance
        .append('companies/$companyID/products/', productID);
    return inserted;
  }

  Future<String> update(Company company) async {
    Map<String, dynamic> com = company.toMap();
    FirebaseHelper.instance.update('companies/${com['id']}', com);
    // FirebaseHelper.update('companies/-NLvOZI7U5judTjQBOI4', com);
    return company.id;
  }

  List<Company> retrieveCompanies(AsyncSnapshot snapshot) {
    Map<String, dynamic> data =
        jsonDecode(jsonEncode(snapshot.data.snapshot.value['companies']))
            as Map<String, dynamic>;
    List<Company> companies = [];
    data.forEach((index, data) {
      data["id"] = index;
      Company category = Company.fromMap(data);
      companies.add(category);
    });

    return companies;
  }

  int retrieveCompaniesCount(AsyncSnapshot snapshot) {
    Map data = snapshot.data.snapshot.value['companies'];
    return data.length;
  }

  Future<List<Company>> fetchCompaniesList() async {
    _companies = [];
    DataSnapshot? snapshot = await FirebaseHelper.instance.read('companies');

    snapshot!.children.forEach((childSnapshot) {
      var company =
          jsonDecode(jsonEncode(childSnapshot.value)) as Map<String, dynamic>;
      company["id"] = childSnapshot.key;
      _companies.add(Company.fromMap(company));
    });
    return _companies;
  }

  Future<void> deleteAll() async {
    FirebaseHelper.instance.delete('companies');
  }

  Future<String> deleteByID(id) async {
    FirebaseHelper.instance.delete('companies/$id');
    return id;
  }

  void reset() {
    deleteAll();
    // insert();
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

  int getCount() {
    return _companies.length;
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
