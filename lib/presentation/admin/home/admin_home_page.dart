import 'package:flutter/material.dart';

import 'package:ar_grocery_companion/presentation/admin/components/admin_drawer.dart';
import 'package:ar_grocery_companion/presentation/admin/components/page_view_list.dart';
import 'package:ar_grocery_companion/utils.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController page = PageController();
    return LayoutBuilder(
        builder: ((BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 600) {
        return Scaffold(
          body: Row(children: [
            AdminDrawer(page: page),
            Expanded(
              child: PageViewList(page: page),
            ),
          ]),
        );
      } else {
        return Scaffold(
          appBar: buildAppBar(context: context),
          drawer: AdminDrawer(page: page),
          body: PageViewList(page: page),
        );
      }
    }));
  }
}
