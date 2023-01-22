import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/cleaning_product.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/food_product.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/itemed_product.dart';
import 'package:ar_grocery_companion/domain/models/product/concrete_products/liquid_product.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/domain/models/product/product_base.dart';
import 'package:ar_grocery_companion/presentation/admin/products/crud/concrete_products/cleaning_form_fields.dart';
import 'package:ar_grocery_companion/presentation/admin/products/crud/concrete_products/food_form_fields.dart';
import 'package:ar_grocery_companion/presentation/admin/products/crud/concrete_products/itemed_form_fields.dart';
import 'package:ar_grocery_companion/presentation/admin/products/crud/concrete_products/liquid_form_fields.dart';
import 'package:ar_grocery_companion/presentation/admin/products/crud/concrete_products/product_base_fields.dart';
import 'package:ar_grocery_companion/presentation/admin/products/crud/property_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ar_grocery_companion/firebase_storage.dart';
import 'package:ar_grocery_companion/presentation/components/image_adder.dart';

class AddProductFields extends StatefulWidget {
  const AddProductFields(
      {super.key, required this.formKey, required this.constraints});
  final BoxConstraints constraints;
  final GlobalKey<FormState> formKey;
  @override
  State<AddProductFields> createState() => _AddProductFieldsState();
}

class _AddProductFieldsState extends State<AddProductFields> {
  ProductBaseFields base = ProductBaseFields();

  bool isFood = false;
  FoodFormFields food = FoodFormFields();

  bool isLiquid = false;
  LiquidFormFields liquid = LiquidFormFields();

  bool isCleaning = false;
  CleaningFormFields cleaning = CleaningFormFields();

  bool isItemed = false;
  ItemedFormFields itemed = ItemedFormFields();
  late String productlogoPath;
  // @override
  // void initState() {
  //   productlogoPath = widget.product.logoPath;
  //   super.initState();
  // }

  updateLogoPath(String newlogoPath) async {
    this.productlogoPath = newlogoPath.split('/').last;
    await FireStorage.uploadFile(
        uploadPath: "images/products_pictures/${productlogoPath}",
        filePath: newlogoPath);
  }

  @override
  Widget build(BuildContext context) {
    return widget.constraints.maxWidth > 600
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                ImageAdder(
                  label: "Product Logo",
                  radius: 300.0,
                  onImageUpload: updateLogoPath,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        base,
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Container(
                            height: 60.0,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                PropertyCheckbox(
                                    title: "Food",
                                    isSelected: isFood,
                                    onChanged: (value) {
                                      setState(() {
                                        isFood = value!;
                                      });
                                    }),
                                PropertyCheckbox(
                                    title: "Liquid",
                                    isSelected: isLiquid,
                                    onChanged: (value) {
                                      setState(() {
                                        isLiquid = value!;
                                      });
                                    }),
                                PropertyCheckbox(
                                    title: "Cleaning",
                                    isSelected: isCleaning,
                                    onChanged: (value) {
                                      setState(() {
                                        isCleaning = value!;
                                      });
                                    }),
                                PropertyCheckbox(
                                    title: "Itemed",
                                    isSelected: isItemed,
                                    onChanged: (value) {
                                      setState(() {
                                        isItemed = value!;
                                      });
                                    }),
                              ],
                            ),
                          ),
                        ),
                        if (isFood) food,
                        if (isLiquid) liquid,
                        if (isCleaning) cleaning,
                        if (isItemed) itemed,
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
                                    Product product = ProductBase(
                                        id: "id",
                                        createdAt: DateTime.now(),
                                        name: base.name,
                                        images: [productlogoPath],
                                        manufacturer: base.manufacturer,
                                        customCategory: base.category,
                                        storesURLs: {
                                          "Spinneys": base.spinneysURL,
                                          "Amazon": base.amazonURL,
                                          "Carrefour": base.carrefourURL
                                        });
                                    if (isFood)
                                      product = FoodProduct(
                                          product: product,
                                          calories: food.calories,
                                          servingSize: food.servingSize,
                                          ingredients:
                                              FoodFormFields.ingredientsList,
                                          allergyInfo:
                                              FoodFormFields.allergiesList,
                                          nutrients: {});
                                    if (isLiquid)
                                      product = LiquidProduct(
                                          product: product,
                                          volume: liquid.volume,
                                          unit: liquid.unit);
                                    if (isItemed)
                                      product = ItemedProduct(
                                          product: product,
                                          noOfItems: itemed.noOfItems);
                                    if (isCleaning)
                                      product = CleaningProduct(
                                          product: product,
                                          materialCleaned:
                                              CleaningFormFields.materialsList);
                                    ProductsRepository.instance
                                        .insert(product)
                                        .then((value) {
                                      context.pop();
                                    });
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
                )
              ])
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageAdder(
                label: "Product Logo",
                radius: 300.0,
                onImageUpload: updateLogoPath,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    base,
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Container(
                        height: 60.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            PropertyCheckbox(
                                title: "Food",
                                isSelected: isFood,
                                onChanged: (value) {
                                  setState(() {
                                    isFood = value!;
                                  });
                                }),
                            PropertyCheckbox(
                                title: "Liquid",
                                isSelected: isLiquid,
                                onChanged: (value) {
                                  setState(() {
                                    isLiquid = value!;
                                  });
                                }),
                            PropertyCheckbox(
                                title: "Cleaning",
                                isSelected: isCleaning,
                                onChanged: (value) {
                                  setState(() {
                                    isCleaning = value!;
                                  });
                                }),
                            PropertyCheckbox(
                                title: "Itemed",
                                isSelected: isItemed,
                                onChanged: (value) {
                                  setState(() {
                                    isItemed = value!;
                                  });
                                }),
                          ],
                        ),
                      ),
                    ),
                    if (isFood) food,
                    if (isLiquid) liquid,
                    if (isCleaning) cleaning,
                    if (isItemed) itemed,
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
                                Product product = ProductBase(
                                    id: "id",
                                    createdAt: DateTime.now(),
                                    name: base.name,
                                    images: [productlogoPath],
                                    manufacturer: base.manufacturer,
                                    customCategory: base.category,
                                    storesURLs: {
                                      "Spinneys": base.spinneysURL,
                                      "Amazon": base.amazonURL,
                                      "Carrefour": base.carrefourURL
                                    });
                                if (isFood)
                                  product = FoodProduct(
                                      product: product,
                                      calories: food.calories,
                                      servingSize: food.servingSize,
                                      ingredients:
                                          FoodFormFields.ingredientsList,
                                      allergyInfo: FoodFormFields.allergiesList,
                                      nutrients: {});
                                if (isLiquid)
                                  product = LiquidProduct(
                                      product: product,
                                      volume: liquid.volume,
                                      unit: liquid.unit);
                                if (isItemed)
                                  product = ItemedProduct(
                                      product: product,
                                      noOfItems: itemed.noOfItems);
                                if (isCleaning)
                                  product = CleaningProduct(
                                      product: product,
                                      materialCleaned:
                                          CleaningFormFields.materialsList);
                                ProductsRepository.instance
                                    .insert(product)
                                    .then((value) {
                                  context.pop();
                                });
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
            ],
          );
  }
}
