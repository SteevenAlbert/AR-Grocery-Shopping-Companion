import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:ar_grocery_companion/presentation/admin/companies/companies_list.dart';

class CompaniesPage extends StatelessWidget {
  const CompaniesPage({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CompaniesList(snapshot: snapshot),
        ],
      ),
      Padding(
        padding: EdgeInsets.all(16),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              context.push('/add_company_page');
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    ]);
  }
}
