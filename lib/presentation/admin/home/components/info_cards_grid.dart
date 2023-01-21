import 'package:ar_grocery_companion/data/helpers/db_helper.dart';
import 'package:ar_grocery_companion/data/repositories/users_repository.dart';
import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/data/repositories/companies_repository.dart';
import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/presentation/admin/home/components/info_card.dart';

class InfoCardGrid extends StatelessWidget {
  const InfoCardGrid({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    int productsCount =
        ProductsRepository.instance.retrieveProductsCount(snapshot);
    int companiesCount =
        CompaniesRepository.instance.retrieveCompaniesCount(snapshot);
    int usersCount = AppUsersRepository.instance.retrieveUsersCount(snapshot);
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.all(16.0),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      shrinkWrap: true,
      crossAxisCount: size.width ~/ 300,
      childAspectRatio: size.width < 600 ? 4 : 2,
      children: [
        InfoCard(
            title: "Users", count: usersCount, icon: Icons.supervisor_account),
        InfoCard(
            title: "Products", count: productsCount, icon: Icons.bakery_dining),
        InfoCard(
            title: "Manufacturers",
            count: companiesCount,
            icon: Icons.apartment),
      ],
    );
  }
}
