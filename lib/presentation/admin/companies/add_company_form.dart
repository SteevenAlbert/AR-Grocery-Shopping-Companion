import 'package:ar_grocery_companion/presentation/admin/components/image_adder.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddCompanyForm extends StatefulWidget {
  const AddCompanyForm({super.key});

  @override
  State<AddCompanyForm> createState() => _AddCompanyFormState();
}

class _AddCompanyFormState extends State<AddCompanyForm> {
  String name = 'Nan';

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageAdder(),
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
                  return 'Please enter the product name';
                }
                if (value.length >= 10) {
                  return 'The name should be at most 10 characters';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}
