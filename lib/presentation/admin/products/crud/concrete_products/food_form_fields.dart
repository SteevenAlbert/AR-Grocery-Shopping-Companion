import 'package:ar_grocery_companion/presentation/admin/products/crud/concrete_products/allergy_field.dart';
import 'package:ar_grocery_companion/presentation/admin/products/crud/concrete_products/ingredient_field.dart';
import 'package:ar_grocery_companion/presentation/admin/products/crud/form_fields_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoodFormFields extends StatefulWidget {
  FoodFormFields({super.key});

  int calories = 0;
  String servingSize = "";
  static List<String> ingredientsList = [""];
  static List<String> allergiesList = [""];

  @override
  State<FoodFormFields> createState() => _FoodFormFieldsState();
}

class _FoodFormFieldsState extends State<FoodFormFields> {

  @override
  void dispose() {
    super.dispose();
    FoodFormFields.ingredientsList = [""];
    FoodFormFields.allergiesList = [""];
  }

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
      SizedBox(height: 16.0,),
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Ingredients",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      ..._getIngredients(),
      SizedBox(height: 16.0,),
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          "Allergy Info",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      ..._getAllergies(),
    ]);
  }

  List<Widget> _getIngredients() {
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < FoodFormFields.ingredientsList.length; i++) {
      friendsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(child: IngredientField(i)),
            SizedBox(
              width: 16,
            ),
            // we need add button at last friends row
            _addRemoveIngredientButton(i == FoodFormFields.ingredientsList.length - 1, i),
          ],
        ),
      ));
    }
    return friendsTextFields;
  }

  Widget _addRemoveIngredientButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          FoodFormFields.ingredientsList.insert(0, "");
        } else
          FoodFormFields.ingredientsList.removeAt(index);
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

  List<Widget> _getAllergies() {
    List<Widget> friendsTextFields = [];
    for (int i = 0; i < FoodFormFields.allergiesList.length; i++) {
      friendsTextFields.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(child: AllergyField(i)),
            SizedBox(
              width: 16,
            ),
            // we need add button at last friends row
            _addRemoveAllergyButton(i == FoodFormFields.allergiesList.length - 1, i),
          ],
        ),
      ));
    }
    return friendsTextFields;
  }

  Widget _addRemoveAllergyButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          FoodFormFields.allergiesList.insert(0, "");
        } else
          FoodFormFields.allergiesList.removeAt(index);
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


