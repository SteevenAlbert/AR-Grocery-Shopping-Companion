import 'package:ar_grocery_companion/models/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../models/category.dart';

// Create a Form widget.
class EditingForm extends StatefulWidget {
  EditingForm({super.key, required this.product});

  Product product;

  @override
  EditingFormState createState() {
    return EditingFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class EditingFormState extends State<EditingForm> {
  final _formKey = GlobalKey<FormState>();
  String dropdownvalue = 'Choose category';
  String name = 'Nan';
  String producer = 'Nan';

  var newImage;

  var _image;
  var imagePicker;
  var type;

  @override
  void initState() {
    super.initState();
    imagePicker = new ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 400,
            child: Image.asset(this.widget.product.images[0],
                fit: BoxFit.fitWidth),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextFormField(
                initialValue: this.widget.product.name,
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
                  return null;
                },
              ),
              TextFormField(
                initialValue: this.widget.product.producer,
                decoration: const InputDecoration(
                  labelText: 'Producer',
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    producer = newValue!;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the product producer';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                items: Category.all
                    .map((e) => e.title)
                    .toList()
                    .map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ButtonBar(children: [
                  ElevatedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        this.widget.product.name = name;
                        this.widget.product.producer = producer;

                        GoRouter.of(context).pop();
                        GoRouter.of(context).push('/products_dashboard');
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
