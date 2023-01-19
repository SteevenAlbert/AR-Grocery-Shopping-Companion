import 'package:flutter/material.dart';

class AddProductFields extends StatefulWidget {
  const AddProductFields({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  @override
  State<AddProductFields> createState() => _AddProductFieldsState();
}

class _AddProductFieldsState extends State<AddProductFields> {
  String name = 'Nan';

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
          SizedBox(
            height: 8,
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // TODO: Add insert category
                    if (widget.formKey.currentState!.validate()) {
                      
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