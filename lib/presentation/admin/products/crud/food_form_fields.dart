import 'package:ar_grocery_companion/presentation/admin/products/crud/form_fields_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoodFormFields extends StatefulWidget {
  FoodFormFields({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  int calories = 0;
  String servingSize = "";

  @override
  State<FoodFormFields> createState() => _FoodFormFieldsState();
}

class _FoodFormFieldsState extends State<FoodFormFields> {
  @override
  Widget build(BuildContext context) {
    return FormFieldsCard(title: "Food Properties", fields: [
      TextFormField(
        decoration: new InputDecoration(labelText: "Calories"),
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ], // Only numbers can be entered
        onChanged: (((value) {
          setState(() {
            widget.calories = int.parse(value);
          });
        })),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the number of calories';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: new InputDecoration(labelText: "Serving Size"),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the serving size followed by its unit';
          }
          return null;
        },
        onChanged: (((value) {
          setState(() {
            widget.servingSize = value;
          });
        })),
      ),
    ]);
  }
}
