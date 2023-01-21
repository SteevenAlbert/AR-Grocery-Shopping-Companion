import 'package:ar_grocery_companion/presentation/admin/products/crud/form_fields_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LiquidFormFields extends StatefulWidget {
  LiquidFormFields({super.key});

  double volume = 0.0;
  String unit = "";

  @override
  State<LiquidFormFields> createState() => _LiquidFormFieldsState();
}

class _LiquidFormFieldsState extends State<LiquidFormFields> {
  @override
  Widget build(BuildContext context) {
    return FormFieldsCard(title: "Liquid Properties", fields: [
      TextFormField(
        decoration: new InputDecoration(labelText: "Volume"),
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
        ], // Only numbers can be entered
        onChanged: (((value) {
          setState(() {
            widget.volume = double.parse(value);
          });
        })),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the volume';
          }
          return null;
        },
      ),
      DropdownButtonFormField(
            items: <String>['mL', 'L']
                .map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                widget.unit = newValue!;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Unit',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please choose a unit';
              }
              return null;
            },
          ),
    ]);
  }
}