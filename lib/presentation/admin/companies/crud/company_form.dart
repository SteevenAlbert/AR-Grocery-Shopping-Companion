import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/presentation/admin/companies/crud/company_fields.dart';
import 'package:ar_grocery_companion/domain/models/company.dart';

class CompanyForm extends StatefulWidget {
  const CompanyForm({super.key, required this.company, required this.add});
  final Company company;
  final bool add;

  @override
  State<CompanyForm> createState() => _CompanyFormState();
}

class _CompanyFormState extends State<CompanyForm> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return CompanyFields(
                formKey: formKey,
                company: widget.company,
                add: widget.add,
                constraints: constraints);
          },
        ),
      ),
      // ),
    );
  }
}
