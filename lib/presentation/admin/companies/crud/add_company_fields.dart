import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class AddCompanyFields extends StatefulWidget {
  AddCompanyFields({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  State<AddCompanyFields> createState() => _AddCompanyFieldsState();
}

class _AddCompanyFieldsState extends State<AddCompanyFields> {
  String name = 'Nan';
  String url = 'Nan';
  String countryText = Country.worldWide.flagEmoji + " Choose Country";
  String countryCode = Country.worldWide.countryCode;

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
                url = newValue!;
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the company url';
              }
              if (!isURL(value)) {
                return 'The url is not valid';
              }
              return null;
            },
          ),
          SizedBox(
            height: 8,
          ),
          FormField(
            builder: ((field) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                      title: Text(countryText),
                      trailing: Icon(Icons.arrow_drop_down),
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          onSelect: (Country country) {
                            setState(() {
                              countryText = country.flagEmoji +
                                  " " +
                                  country.displayNameNoCountryCode;
                              countryCode = country.countryCode;
                              field.setValue(countryCode);
                            });
                          },
                        );
                      },
                    ),
                Text(field.errorText??"", style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.red[700]),),
              ],
            )),
            validator: (value) {
              if (value == null) {
                return 'Please choose a country';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (widget.formKey.currentState!.validate()) {
                      // TODO: add product
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
