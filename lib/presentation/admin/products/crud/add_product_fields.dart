import 'package:ar_grocery_companion/data/repositories/categories_repository.dart';
import 'package:ar_grocery_companion/data/repositories/companies_repository.dart';
import 'package:ar_grocery_companion/presentation/admin/products/crud/cleaning_form_fields.dart';
import 'package:ar_grocery_companion/presentation/admin/products/crud/food_form_fields.dart';
import 'package:ar_grocery_companion/presentation/admin/products/crud/itemed_form_fields.dart';
import 'package:ar_grocery_companion/presentation/admin/products/crud/liquid_form_fields.dart';
import 'package:flutter/material.dart';

class AddProductFields extends StatefulWidget {
  const AddProductFields({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  @override
  State<AddProductFields> createState() => _AddProductFieldsState();
}

class _AddProductFieldsState extends State<AddProductFields> {
  String name = 'Nan';
  String category = 'Choose a category';
  String manufacturer = 'Choose a company';

  bool isFood = false;
  FoodFormFields? food;

  bool isLiquid = false;
  LiquidFormFields? liquid;

  bool isCleaning = false;
  CleaningFormFields? cleaning;

  bool isItemed = false;
  ItemedFormFields? itemed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
            ),
            onChanged: (String? newValue) {
              setState(() {
                name = newValue!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the category name';
              }
              if (value.length >= 15) {
                return 'The name should be at most 15 characters';
              }
              return null;
            },
          ),
          DropdownButtonFormField(
            items: CategoriesRepository.instance
                .getCategories()
                .map((e) => e.name)
                .toList()
                .map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                category = newValue!;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Category',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please choose a category';
              }
              return null;
            },
          ),
          DropdownButtonFormField(
            items: CompaniesRepository.instance
                .getCompanies()
                .map((e) => e.name)
                .toList()
                .map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                manufacturer = newValue!;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Manufacturer',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please choose a manufaturer';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Container(
              height: 60.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  propertyCheckbox(context, "Food", isFood, (value) {
                    setState(() {
                      isFood = value!;
                    });
                  }),
                  propertyCheckbox(context, "Liquid", isLiquid, (value) {
                    setState(() {
                      isLiquid = value!;
                    });
                  }),
                  propertyCheckbox(context, "Cleaning", isCleaning, (value) {
                    setState(() {
                      isCleaning = value!;
                    });
                  }),
                  propertyCheckbox(context, "Itemed", isItemed, (value) {
                    setState(() {
                      isItemed = value!;
                    });
                  }),
                ],
              ),
            ),
          ),
          if (isFood)
            food = FoodFormFields(
              formKey: widget.formKey,
            ),
          if (isLiquid)
            liquid = LiquidFormFields(
              formKey: widget.formKey,
            ),
          if (isCleaning)
            cleaning = CleaningFormFields(
              formKey: widget.formKey,
            ),
          if (isItemed)
            itemed = ItemedFormFields(
              formKey: widget.formKey,
            ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // TODO: Add insert product
                    if (widget.formKey.currentState!.validate()) {
                      //food?.servingSize
                    }
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget propertyCheckbox(
    BuildContext context, String title, bool isSelected, Function onChanged) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: 200,
      minWidth: 200,
    ),
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: CheckboxListTile(
        value: isSelected,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
            side:
                BorderSide(color: Theme.of(context).primaryColor, width: 2.0)),
        checkboxShape: CircleBorder(),
        tileColor: isSelected ? Theme.of(context).primaryColor : null,
        activeColor: Theme.of(context).primaryColor,
        title: Text(
          title,
        ),
        onChanged: (((value) {
          onChanged(value);
        })),
      ),
    ),
  );
}
