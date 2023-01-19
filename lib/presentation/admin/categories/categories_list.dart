import 'package:ar_grocery_companion/data/repositories/categories_repository.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:ar_grocery_companion/presentation/admin/components/delete_button.dart';
import 'package:ar_grocery_companion/presentation/admin/components/element_datagrid.dart';
import 'package:ar_grocery_companion/presentation/admin/components/list_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key});

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  List<CustomCategory> categories = <CustomCategory>[];
  late CustomCategoryDataSource categoryDataSource;
  final DataGridController dataGridController = DataGridController();

  @override
  void initState() {
    super.initState();
    categories = CategoriesRepository.instance.getCategories();
    categoryDataSource =
        CustomCategoryDataSource(categoryData: categories, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return ListCard(
        title: "Categories",
        // TODO: add delete function
        trailing: DataGridDeleteButton(
          dataGridController: dataGridController,
          deleteFunction: () {},
        ),
        list: ElementsDataGrid(
          dataSource: categoryDataSource,
          columnNames: ['name', 'edit'],
          dataGridController: dataGridController,
        ));
  }
}

class CustomCategoryDataSource extends DataGridSource {
  CustomCategoryDataSource(
      {required List<CustomCategory> categoryData, required this.context}) {
    _categoryData = categoryData
        .map<DataGridRow>(
          (category) => DataGridRow(cells: [
            DataGridCell<String>(columnName: 'name', value: category.name),
            DataGridCell<Function>(
                  columnName: 'edit',
                  value: () {
                    context.push('/edit_category_page', extra: category);
                  }),
          ]),
        )
        .toList();
  }

  List<DataGridRow> _categoryData = [];
  BuildContext context;

  @override
  List<DataGridRow> get rows => _categoryData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
          alignment: Alignment.centerLeft,
          child: e.columnName == 'edit'
              ? IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: e.value,
                )
              : Text(e.value.toString(),
                  style: Theme.of(context).textTheme.labelLarge));
    }).toList());
  }
}
