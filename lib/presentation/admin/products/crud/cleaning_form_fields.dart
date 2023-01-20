import 'package:ar_grocery_companion/presentation/admin/products/crud/form_fields_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CleaningFormFields extends StatefulWidget {
  CleaningFormFields({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  State<CleaningFormFields> createState() => _CleaningFormFieldsState();
}

class _CleaningFormFieldsState extends State<CleaningFormFields> {
  @override
  Widget build(BuildContext context) {
    return FormFieldsCard(title: "Cleaning Properties", fields: [
      
    ]);
  }
}