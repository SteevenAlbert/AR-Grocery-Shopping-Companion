import 'package:ar_grocery_companion/data/repositories/companies_repository.dart';
import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/presentation/admin/home/components/info_card.dart';
import 'package:flutter/material.dart';

class InfoCardGrid extends StatelessWidget {
  const InfoCardGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GridView.count(
      padding: EdgeInsets.all(16.0),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      shrinkWrap: true,
      crossAxisCount: size.width ~/ 300,
      childAspectRatio: size.width < 600 ? 4 : 2,
      children: [
        InfoCard(
            title: "Users",
            count: 0,
            icon: Icons.supervisor_account),
        InfoCard(
            title: "Products",
            count: ProductsRepository.instance.getCount(),
            icon: Icons.bakery_dining),
        InfoCard(
            title: "Manufacturers",
            count: CompaniesRepository.instance.getCount(),
            icon: Icons.apartment),
        
      ],
    );
  }
}
