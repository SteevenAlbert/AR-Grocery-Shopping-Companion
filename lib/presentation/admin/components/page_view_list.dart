import 'package:ar_grocery_companion/data/helpers/db_helper.dart';
import 'package:ar_grocery_companion/data/repositories/categories_repository.dart';
import 'package:ar_grocery_companion/data/repositories/companies_repository.dart';
import 'package:ar_grocery_companion/presentation/admin/categories/categories_page.dart';
import 'package:ar_grocery_companion/presentation/admin/companies/companies_page.dart';
import 'package:ar_grocery_companion/presentation/admin/products/products_page.dart';
import 'package:ar_grocery_companion/presentation/settings/settings_page.dart';
import 'package:flutter/material.dart';
import '../home/components/dashboard.dart';

class PageViewList extends StatefulWidget {
  PageViewList({super.key, required this.page});

  final PageController page;

  @override
  State<PageViewList> createState() => _PageViewListState();
}

class _PageViewListState extends State<PageViewList> {

  @override
  void initState() {
    CategoriesRepository.instance.fetchCategoriesList();
    CompaniesRepository.instance.fetchCompaniesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseHelper.instance.dbRef.onValue,
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.hasData && snapshot.data.snapshot.value != null) {
            return PageView(
              controller: widget.page,
              children: [
                Dashboard(snapshot: snapshot,),
                ProductsPage(snapshot: snapshot,),
                CategoriesPage(snapshot: snapshot,),
                CompaniesPage(snapshot: snapshot,),
                SettingsPage()
              ],
            );
          }
          return Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator());
        }));
  }
}
