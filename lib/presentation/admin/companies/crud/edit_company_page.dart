import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/utils.dart';
import 'package:ar_grocery_companion/presentation/admin/companies/crud/company_form.dart';
import 'package:flutter/material.dart';

class EditCompanyPage extends StatelessWidget {
  EditCompanyPage({super.key, required this.company});
  final Company company;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context),
      body: ListView(
        children: [
          Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Edit Company",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              )),
          CompanyForm(company: company, add: false),
        ],
      ),
    );
  }
}
