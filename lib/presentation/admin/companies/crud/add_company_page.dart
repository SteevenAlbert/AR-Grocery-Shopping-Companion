import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/presentation/admin/companies/crud/add_company_form.dart';
import 'package:ar_grocery_companion/utils.dart';
import 'package:ar_grocery_companion/domain/models/company.dart';

class AddCompanyPage extends StatelessWidget {
  AddCompanyPage({super.key});
  final Company company = Company(id: "", name: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context),
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Add Company",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              )),
          AddCompanyForm(company: company, add: true),
        ],
      ),
    );
  }
}
