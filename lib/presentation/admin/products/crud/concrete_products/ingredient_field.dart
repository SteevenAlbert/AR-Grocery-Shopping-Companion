import 'package:ar_grocery_companion/presentation/admin/products/crud/concrete_products/food_form_fields.dart';
import 'package:flutter/material.dart';

class IngredientField extends StatefulWidget {
  final int index;
  IngredientField(this.index);
  @override
  _IngredientFieldState createState() => _IngredientFieldState();
}

class _IngredientFieldState extends State<IngredientField> {
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
      _nameController.text = FoodFormFields.ingredientsList[widget.index];
    });

    return TextFormField(
      controller: _nameController,
      onChanged: (v) => FoodFormFields.ingredientsList[widget.index] = v,
      decoration: InputDecoration(hintText: 'Ingredient'),
      validator: (v) {
        if (v!.trim().isEmpty) return 'Please enter at least one ingredient and remove unused fields';
        return null;
      },
    );
  }
}