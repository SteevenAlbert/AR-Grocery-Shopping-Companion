import 'package:ar_grocery_companion/presentation/admin/companies/crud/add_company_form.dart';
import 'package:ar_grocery_companion/utils.dart';
import 'package:flutter/material.dart';

class AddCompanyPage extends StatelessWidget {
  const AddCompanyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context: context),
      body:ListView(
      children: [
        Padding(padding: EdgeInsets.all(16.0), child: Text("Add Manufacturer", style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),)),
        AddCompanyForm(),
      ],
    ));
  }
}