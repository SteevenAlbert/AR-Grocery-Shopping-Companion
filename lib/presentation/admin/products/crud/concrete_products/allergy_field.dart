import 'package:ar_grocery_companion/presentation/admin/products/crud/concrete_products/food_form_fields.dart';
import 'package:flutter/material.dart';

class AllergyField extends StatefulWidget {
  final int index;
  AllergyField(this.index);
  @override
  _AllergyFieldState createState() => _AllergyFieldState();
}

class _AllergyFieldState extends State<AllergyField> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _nameController.text = FoodFormFields.allergiesList[widget.index];
    });

    return TextFormField(
      controller: _nameController,
      onChanged: (v) => FoodFormFields.allergiesList[widget.index] = v,
      decoration: InputDecoration(hintText: 'Allergy'),
      validator: (v) {
        // if (v!.trim().isEmpty) return 'Please enter at least one allergy and remove unused fields';
        return null;
      },
    );
  }
}