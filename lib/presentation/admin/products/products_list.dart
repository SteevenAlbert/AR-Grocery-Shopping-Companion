import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/presentation/admin/components/delete_button.dart';
import 'package:ar_grocery_companion/presentation/admin/components/element_datagrid.dart';
import 'package:ar_grocery_companion/presentation/admin/components/list_card.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  List<Product> products = <Product>[];
  late ProductDataSource productDataSource;
  final DataGridController dataGridController = DataGridController();

  @override
  void initState() {
    super.initState();
    products = ProductsRepository.instance.getProducts();
    productDataSource =
        ProductDataSource(productData: products, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return ListCard(
        title: "Products",
        // TODO: add delete function
        trailing: DataGridDeleteButton(dataGridController: dataGridController, deleteFunction: (){},),
        list: ElementsDataGrid(
          dataSource: productDataSource,
          columnNames: ['name', 'manufacturer', 'category'],
          dataGridController: dataGridController,
        ));
  }
}

class ProductDataSource extends DataGridSource {
  ProductDataSource(
      {required List<Product> productData, required this.context}) {
    _productData = productData
        .map<DataGridRow>((product) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'name', value: product.name),
              DataGridCell<String>(
                  columnName: 'manufacturer', value: product.manufacturer.name),
              DataGridCell<String>(
                  columnName: 'category', value: product.customCategory.name),
            ]))
        .toList();
  }

  List<DataGridRow> _productData = [];
  BuildContext context;

  @override
  List<DataGridRow> get rows => _productData;

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
