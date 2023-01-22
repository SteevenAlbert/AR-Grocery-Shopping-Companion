import 'package:ar_grocery_companion/presentation/admin/products/crud/form_fields_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ItemedFormFields extends StatefulWidget {
  ItemedFormFields({super.key,});

  int noOfItems = 0;

  @override
  State<ItemedFormFields> createState() => _ItemedFormFieldsState();
}

class _ItemedFormFieldsState extends State<ItemedFormFields> {
  @override
  Widget build(BuildContext context) {
    return FormFieldsCard(title: "Items Properties", fields: [
      TextFormField(
        decoration: new InputDecoration(labelText: "Number of items"),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ], // Only numbers can be entered
        onChanged: (((value) {
          setState(() {
            widget.noOfItems = int.parse(value);
          });
        })),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the number of items';
          }
          return null;
        },
      ),
    ]);
  }
}