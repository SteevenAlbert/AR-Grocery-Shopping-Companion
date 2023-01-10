import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../models/product/product_category.dart';

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
          GestureDetector(
            onTap: () async {
              var source = ImageSource.gallery;
              XFile image = await imagePicker.pickImage(
                  source: source,
                  imageQuality: 50,
                  preferredCameraDevice: CameraDevice.front);

              final Directory directory =
                  await getApplicationDocumentsDirectory();

              newImage =
                  await File(image.path).copy('${directory.path}/image2.png');

              setState(() {
                _image = File(image.path);
              });
            },
            child: Container(
              height: 400,
              child: _image != null
                  ? Image.file(
                      _image,
                      fit: BoxFit.fitWidth,
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
                  if (value.length >= 10) {
                    return 'The name should be at most 10 characters';
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
                  } else if (value.length >= 15) {
                    return 'The producer name should be at most 10 characters';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField(
                items: ProductCategory.all
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
                        // TODO: add product
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
