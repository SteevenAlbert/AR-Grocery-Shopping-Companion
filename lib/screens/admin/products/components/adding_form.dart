import 'dart:io';

import 'package:ar_grocery_companion/models/product.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../models/category.dart';

// Create a Form widget.
class AddingForm extends StatefulWidget {
  const AddingForm({super.key});

  @override
  AddingFormState createState() {
    return AddingFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class AddingFormState extends State<AddingForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  String dropdownvalue = 'Choose category';
  String name = 'Nan';
  String producer = 'Nan';
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
          GestureDetector(
            onTap: () async {
              var source = ImageSource.gallery;
              XFile image = await imagePicker.pickImage(
                  source: source,
                  imageQuality: 50,
                  preferredCameraDevice: CameraDevice.front);
              setState(() {
                _image = File(image.path);
              });
            },
            child: Container(
              height: 400,
              child: _image != null
                  ? Image.file(
                      _image,
                      height: 400.0,
                      fit: BoxFit.fitHeight,
                    )
                  : Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          color: Theme.of(context).highlightColor),
                      height: 400,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  return null;
                },
              ),
              TextFormField(
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
                        Product.add(Product(
                            name: name,
                            prices: {
                              'Ragab Sons': 20,
                              'Oscar': 35,
                              'Panda': 25,
                              'Hyper One': 22
                            },
                            calories: 40,
                            ingredients: [
                              "Milk",
                              "Organic Guar Gum",
                              "Vanilla Extract",
                              "Pectin"
                            ],
                            servingSize: '60g',
                            nutrients: {
                              "FAT": {"amount": 7, "unit": "g"},
                              "SATFAT": {"amount": 5, "unit": "g"},
                              "TRANSFAT": {"amount": 2, "unit": "g"},
                              "CHOLE": {"amount": 67.51, "unit": "g"},
                              "NA": {"amount": 67.51, "unit": "g"},
                              "CHOCDF": {"amount": 67.51, "unit": "g"},
                              "FIBTG": {"amount": 67.51, "unit": "g"},
                              "SUGAR": {"amount": 67.51, "unit": "g"},
                              "PROCNT": {"amount": 67.51, "unit": "g"},
                            },
                            producer: producer,
                            image: "assets/images/greek.png"));
                        GoRouter.of(context).pop();
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
