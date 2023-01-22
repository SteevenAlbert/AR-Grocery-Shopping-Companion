import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:ar_grocery_companion/data/repositories/companies_repository.dart';

CompaniesRepository companies = CompaniesRepository.instance;

class DataGridDeleteButton extends StatelessWidget {
  DataGridDeleteButton(
      {super.key,
      required this.dataGridController,
      required this.deleteFunction});
  final DataGridController dataGridController;
  final Function deleteFunction;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: Text('Delete'),
                  content: Container(
                    height: MediaQuery.of(context).size.height / 10,
                    child: Column(
                      children: [
                        dataGridController.selectedRows.isEmpty
                            ? Text("Nothing to delete, select items first.")
                            : Text(
                                "Are you sure you want to delete the selected item(s)?"),
                      ],
                    ),
                  ),
                  actions: [
                    dataGridController.selectedRows.isEmpty
                        ? TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        : ButtonBar(
                            children: [
                              TextButton(
                                child: const Text('No'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              ElevatedButton(
                                child: const Text('Yes'),
                                onPressed: () {
                                  deleteFunction();
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          )
                  ],
                );
              });
        });
  }
}
