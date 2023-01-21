import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/presentation/admin/components/delete_button.dart';
import 'package:ar_grocery_companion/presentation/admin/components/element_datagrid.dart';
import 'package:ar_grocery_companion/presentation/admin/components/list_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
        trailing: DataGridDeleteButton(
          dataGridController: dataGridController,
          deleteFunction: () {
            for (var i = 0; i < dataGridController.selectedRows.length; i++) {
            Product company = products.firstWhere((element) =>
                element.name ==
                dataGridController.selectedRows[i].getCells()[0].value);
            ProductsRepository.instance.deleteByID(company.id);
          }
          },
        ),
        list: ElementsDataGrid(
          dataSource: productDataSource,
          columnNames: ['name', 'manufacturer', 'category', 'edit'],
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
              DataGridCell<Function>(
                  columnName: 'edit',
                  value: () {
                    // context.push('/edit_product_page', extra: product);
                  }),
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
