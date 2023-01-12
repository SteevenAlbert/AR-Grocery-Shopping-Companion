import 'package:ar_grocery_companion/presentation/admin/home/components/dashboard.dart';
import 'package:ar_grocery_companion/presentation/admin/home/wide_admin_module.dart';
import 'package:ar_grocery_companion/utils.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: ((BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 600) {
        return WideAdminModule();
      } else {
        return Scaffold(
          appBar: buildAppBar(context: context),
          drawer: Drawer(),
          body: Dashboard(),
        );
      }
    }));
  }
}
