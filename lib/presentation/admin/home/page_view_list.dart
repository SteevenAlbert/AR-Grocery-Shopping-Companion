import 'package:flutter/material.dart';

import 'package:ar_grocery_companion/presentation/admin/companies/companies_page.dart';
import 'package:ar_grocery_companion/presentation/settings/settings_page.dart';

import 'components/dashboard.dart';

class PageViewList extends StatelessWidget {
  PageViewList({super.key, required this.page});

  final PageController page;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: page,
      children: [Dashboard(), CompaniesPage(), SettingsPage()],
    );
  }
}
