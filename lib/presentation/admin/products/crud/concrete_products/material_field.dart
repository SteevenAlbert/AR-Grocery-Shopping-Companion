import 'package:ar_grocery_companion/presentation/admin/products/crud/concrete_products/cleaning_form_fields.dart';
import 'package:ar_grocery_companion/presentation/admin/products/crud/concrete_products/food_form_fields.dart';
import 'package:flutter/material.dart';

class MaterialField extends StatefulWidget {
  final int index;
  MaterialField(this.index);
  @override
  _MaterialFieldState createState() => _MaterialFieldState();
}

class _MaterialFieldState extends State<MaterialField> {
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
      _nameController.text = CleaningFormFields.materialsList[widget.index];
    });

    return TextFormField(
      controller: _nameController,
      onChanged: (v) => CleaningFormFields.materialsList[widget.index] = v,
      decoration: InputDecoration(hintText: 'Material'),
      validator: (v) {
        // if (v!.trim().isEmpty) return 'Please enter at least one allergy and remove unused fields';
        return null;
      },
    );
  }
}