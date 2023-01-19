import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ar_grocery_companion/presentation/admin/companies/companies_list.dart';
import 'package:ar_grocery_companion/presentation/admin/companies/list_card.dart';

class CompaniesPage extends StatelessWidget {
  const CompaniesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0),
          child: ElevatedButton(
              onPressed: () {
                context.push("/add_company_page");
              },
              child: Text("Add Company")),
        ),
        ListCard(title: "Companies", list: CompaniesList()),
      ],
    );
  }
}
