import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ar_grocery_companion/presentation/admin/companies/companies_list.dart';

class CompaniesPage extends StatelessWidget {
  const CompaniesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CompaniesList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push('/add_company_page');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
