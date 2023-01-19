import 'package:ar_grocery_companion/data/repositories/categories_repository.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:ar_grocery_companion/presentation/admin/components/element_datagrid.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  List<CustomCategory> categories = <CustomCategory>[];
  late CustomCategoryDataSource companyDataSource;

  @override
  void initState() {
    super.initState();
    categories = CategoriesRepository.instance.getCategories();
    companyDataSource =
        CustomCategoryDataSource(companyData: categories, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return ElementsDataGrid(
        dataSource: companyDataSource, columnNames: ['name']);
  }
}

class CustomCategoryDataSource extends DataGridSource {
  CustomCategoryDataSource(
      {required List<CustomCategory> companyData, required this.context}) {
    _companyData = companyData
        .map<DataGridRow>((company) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'name', value: company.name),
            ]))
        .toList();
  }

  List<DataGridRow> _companyData = [];
  BuildContext context;

  @override
  List<DataGridRow> get rows => _companyData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(16.0),
        child: Text(e.value.toString(),
            style: Theme.of(context).textTheme.labelLarge),
      );
    }).toList());
  }
}
