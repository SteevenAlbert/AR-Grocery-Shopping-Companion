import 'package:ar_grocery_companion/presentation/admin/products/crud/concrete_products/material_field.dart';
import 'package:ar_grocery_companion/presentation/admin/products/crud/form_fields_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CleaningFormFields extends StatefulWidget {
  CleaningFormFields({super.key});

  static List<String> materialsList = [""];

  @override
  State<CleaningFormFields> createState() => _CleaningFormFieldsState();
}

class _CleaningFormFieldsState extends State<CleaningFormFields> {

  @override
  void dispose() {
    super.dispose();
    CleaningFormFields.materialsList = [""];
  }

  @override
  Widget build(BuildContext context) {
    return FormFieldsCard(title: "Cleaning Properties", fields: [
      SizedBox(height: 16.0,),
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Material supported",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      ..._getMaterials(),
    ]);
  }

  List<Widget> _getMaterials() {
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < CleaningFormFields.materialsList.length; i++) {
      friendsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(child: MaterialField(i)),
            SizedBox(
              width: 16,
            ),
            // we need add button at last friends row
            _addRemoveMaterialButton(i == CleaningFormFields.materialsList.length - 1, i),
          ],
        ),
      ));
    }
    return friendsTextFields;
  }

  Widget _addRemoveMaterialButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          CleaningFormFields.materialsList.insert(0, "");
        } else
          CleaningFormFields.materialsList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Theme.of(context).primaryColor : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}