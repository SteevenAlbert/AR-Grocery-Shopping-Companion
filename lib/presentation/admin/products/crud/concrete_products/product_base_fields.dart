import 'package:ar_grocery_companion/data/repositories/categories_repository.dart';
import 'package:ar_grocery_companion/data/repositories/companies_repository.dart';
import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

class ProductBaseFields extends StatefulWidget {
  ProductBaseFields({super.key});

  String name = 'Nan';
  String amazonURL = 'Nan';
  String spinneysURL = 'Nan';
  String luluURL = 'Nan';
  CustomCategory category = CustomCategory.empty();
  Company manufacturer = Company.empty();

  @override
  State<ProductBaseFields> createState() => _ProductBaseFieldsState();
}

class _ProductBaseFieldsState extends State<ProductBaseFields> {
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Name',
        ),
        controller: _nameController,
        onChanged: (String? newValue) {
          setState(() {
            widget.name = newValue!;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the product name';
          }
          if (value.length >= 35) {
            return 'The name should be at most 35 characters';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Amazon URL',
        ),
        onChanged: (String? newValue) {
          setState(() {
            widget.amazonURL = newValue!;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the product amazon page URL';
          }
          if (!isURL(value)) {
            return 'The URL is not valid';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Spinneys URL',
        ),
        onChanged: (String? newValue) {
          setState(() {
            widget.spinneysURL = newValue!;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the product spinneys page URL';
          }
          if (!isURL(value)) {
            return 'The URL is not valid';
          }
          return null;
        },
      ),
      TextFormField(
        decoration: const InputDecoration(
          labelText: 'Lulu URL',
        ),
        onChanged: (String? newValue) {
          setState(() {
            widget.luluURL = newValue!;
          });
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the product Lulu page URL';
          }
          if (!isURL(value)) {
            return 'The URL is not valid';
          }
          return null;
        },
      ),
      DropdownButtonFormField(
        items: CategoriesRepository.instance
            .getCategories()
            .map((CustomCategory items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items.name),
          );
        }).toList(),
        onChanged: (CustomCategory? newValue) {
          setState(() {
            widget.category = newValue!;
          });
        },
        decoration: const InputDecoration(
          labelText: 'Category',
        ),
        validator: (value) {
          if (value == null) {
            return 'Please choose a category';
          }
          return null;
        },
      ),
      DropdownButtonFormField(
        items: CompaniesRepository.instance.getCompanies().map((Company item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item.name),
          );
        }).toList(),
        onChanged: (Company? newValue) {
          setState(() {
            widget.manufacturer = newValue!;
          });
        },
        decoration: const InputDecoration(
          labelText: 'Manufacturer',
        ),
        validator: (value) {
          if (value == null) {
            return 'Please choose a manufaturer';
          }
          return null;
        },
      )
    ]);
  }
}
