import 'package:ar_grocery_companion/constants/constants.dart';
import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/presentation/components/products_grid.dart';
import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/utils.dart';
import 'package:flutter/material.dart';

class CompanyDetails extends StatelessWidget {
  CompanyDetails({super.key, required this.company});

  final Company company;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context),
      body: Column(
        children: [
          ListTile(
            leading: Image.asset(company.logoPath??kNoLogoImg),
            title: Text(company.name),
            subtitle: Text(company.country?.name??"Country not available"),
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductsGrid(products:ProductsRepository.instance.getProductsListByManufacturer(company.id)),
          )),
        ],
      ),
    );
  }
}