import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class AddCompanyFields extends StatefulWidget {
  const AddCompanyFields({super.key});

  @override
  State<AddCompanyFields> createState() => _AddCompanyFieldsState();
}

class _AddCompanyFieldsState extends State<AddCompanyFields> {
  String name = 'Nan';
  String countryName = 'Nan';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                return 'Please enter the company name';
              }
              if (value.length >= 15) {
                return 'The name should be at most 15 characters';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'URL',
            ),
            onChanged: (String? newValue) {
              setState(() {
                name = newValue!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the product name';
              }
              if (value.length >= 15) {
                return 'The name should be at most 15 characters';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Country',
            ),
            onTap: () {
              showCountryPicker(
                context: context,
                onSelect: (Country country) {
                  setState(() {
                    countryName = country.displayName;
                  });
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
