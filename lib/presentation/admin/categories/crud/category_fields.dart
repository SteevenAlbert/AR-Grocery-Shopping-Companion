import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/data/repositories/categories_repository.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:go_router/go_router.dart';
import 'package:ar_grocery_companion/firebase_storage.dart';
import 'package:ar_grocery_companion/presentation/components/image_adder.dart';

CategoriesRepository categories = CategoriesRepository.instance;

class CategoryFields extends StatefulWidget {
  const CategoryFields(
      {super.key,
      required this.formKey,
      required this.add,
      required this.customCategory,
      required this.constraints});

  final GlobalKey<FormState> formKey;
  final bool add;
  final CustomCategory customCategory;
  final BoxConstraints constraints;
  @override
  State<CategoryFields> createState() => _CategoryFieldsState();
}

class _CategoryFieldsState extends State<CategoryFields> {
  var textController;
  late String? imagePath;
  @override
  void initState() {
    imagePath = widget.customCategory.imagePath!;
    super.initState();
  }

  updateImagePath(String newimagePath) async {
    this.imagePath = newimagePath.split('/').last;
    await FireStorage.uploadFile(
        uploadPath: "images/categories_pictures/${imagePath}",
        filePath: newimagePath);
  }

  @override
  Widget build(BuildContext context) {
    textController = widget.add
        ? TextEditingController(text: "")
        : TextEditingController(text: widget.customCategory.name);
    return widget.constraints.maxWidth > 600
        ? Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            widget.add || imagePath == null
                ? ImageAdder(
                    label: "Category Image",
                    radius: 300.0,
                    onImageUpload: updateImagePath,
                  )
                : FutureBuilder(
                    future: FireStorage.getUrl(
                        "/images/categories_pictures/$imagePath"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ImageAdder(
                          label: "Category Image",
                          url: snapshot.data,
                          radius: 300.0,
                          onImageUpload: updateImagePath,
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text("${snapshot.error}"));
                      } else {
                        return Center(child: const CircularProgressIndicator());
                      }
                    }),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                      controller: textController,
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
                              if (widget.formKey.currentState!.validate()) {
                                CustomCategory category = widget.customCategory
                                    .copyWith(
                                        name: textController.text,
                                        imagePath: imagePath);
                                print(category);
                                widget.add
                                    ? categories.insert(category)
                                    : categories.update(category);
                                context.go('/admin_homepage');
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ])
        : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            widget.add || imagePath == null
                ? ImageAdder(
                    label: "Category Image",
                    radius: 300.0,
                    onImageUpload: updateImagePath,
                  )
                : FutureBuilder(
                    future: FireStorage.getUrl(
                        "/images/categories_pictures/$imagePath"),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ImageAdder(
                          label: "Category Image",
                          url: snapshot.data,
                          radius: 300.0,
                          onImageUpload: updateImagePath,
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text("${snapshot.error}"));
                      } else {
                        return Center(child: const CircularProgressIndicator());
                      }
                    }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    controller: textController,
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
                            if (widget.formKey.currentState!.validate()) {
                              CustomCategory category = widget.customCategory
                                  .copyWith(
                                      name: textController.text,
                                      imagePath: imagePath);
                              print(category);
                              widget.add
                                  ? categories.insert(category)
                                  : categories.update(category);
                              context.go('/admin_homepage');
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textController.dispose();
    super.dispose();
  }
}
