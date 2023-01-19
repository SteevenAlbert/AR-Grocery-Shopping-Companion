import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class ElementsDataGrid extends StatefulWidget {
  ElementsDataGrid(
      {super.key, required this.dataSource, required this.dataGridController, required this.columnNames});

  final DataGridSource dataSource;
  final DataGridController dataGridController;
  final List<String> columnNames;

  @override
  State<ElementsDataGrid> createState() => _ElementsDataGridState();
}

class _ElementsDataGridState extends State<ElementsDataGrid> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<GridColumn> gridColumns = [];
    widget.columnNames.forEach((element) {
      gridColumns.add(GridColumn(
          allowSorting: element == 'edit'? false: true,
          allowFiltering: element == 'edit'? false: true,
          columnName: element,
          label: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              element.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          )));
    });

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: SfDataGridTheme(
        data: SfDataGridThemeData(
          selectionColor: Theme.of(context).primaryColor.withOpacity(0.2),
          headerColor: Theme.of(context).canvasColor,
          sortIconColor: Theme.of(context).primaryColor,
          filterIconColor: Theme.of(context).primaryColor,
        ),
        child: SfDataGrid(
          source: widget.dataSource,
          allowSorting: true,
          allowFiltering: true,
          isScrollbarAlwaysShown: true,
          gridLinesVisibility: GridLinesVisibility.none,
          headerGridLinesVisibility: GridLinesVisibility.none,
          selectionMode: SelectionMode.multiple,
          showCheckboxColumn: true,
          checkboxShape: CircleBorder(),
          controller: widget.dataGridController,
          columnWidthMode: MediaQuery.of(context).size.width > 800
              ? ColumnWidthMode.fill
              : ColumnWidthMode.auto,
          columns: gridColumns,
        ),
      ),
    );
  }
}
