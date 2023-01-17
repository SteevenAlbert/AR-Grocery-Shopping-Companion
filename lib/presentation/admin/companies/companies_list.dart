import 'package:ar_grocery_companion/constants/constants.dart';
import 'package:ar_grocery_companion/data/repositories/companies_repository.dart';
import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:flutter/material.dart';

class CompaniesList extends StatelessWidget {
  const CompaniesList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Company> companies = CompaniesRepository.instance.getCompanies();
    return ListView.builder(
      itemCount: companies.length,
      itemBuilder: ((context, index) {
        return ListTile(
          leading: CircleAvatar(
              backgroundColor: Theme.of(context).canvasColor.withOpacity(0.1),
              child: Image.asset(
                companies[index].logoPath ?? kNoLogoImg,
              )),
          title: Text(companies[index].name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
              IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
            ],
          ),
          onTap: () {},
        );
      }),
    );
  }
}
