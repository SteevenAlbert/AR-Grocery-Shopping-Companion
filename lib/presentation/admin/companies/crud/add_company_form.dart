import 'package:flutter/material.dart';

import 'package:ar_grocery_companion/presentation/admin/companies/crud/add_company_fields.dart';
import 'package:ar_grocery_companion/presentation/admin/components/image_adder.dart';

class AddCompanyForm extends StatefulWidget {
  const AddCompanyForm({super.key});

  @override
  State<AddCompanyForm> createState() => _AddCompanyFormState();
}

class _AddCompanyFormState extends State<AddCompanyForm> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ImageAdder(),
                  Expanded(child: AddCompanyFields(formKey: formKey)),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ImageAdder(), AddCompanyFields(formKey: formKey)],
              );
            }
          },
        ),
      ),
    );
  }
}
