import 'package:ar_grocery_companion/data/repositories/users_repository.dart';
import 'package:ar_grocery_companion/domain/models/user/app_user.dart';
import 'package:ar_grocery_companion/presentation/admin/components/delete_button.dart';
import 'package:ar_grocery_companion/presentation/admin/components/element_datagrid.dart';
import 'package:ar_grocery_companion/presentation/admin/components/list_card.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AppUsersList extends StatefulWidget {
  const AppUsersList({super.key});

  @override
  State<AppUsersList> createState() => _AppUsersListState();
}

class _AppUsersListState extends State<AppUsersList> {
  List<AppUser> users = <AppUser>[];
  late AppUserDataSource userDataSource;
  final DataGridController dataGridController = DataGridController();

  @override
  void initState() {
    super.initState();
    // users = AppUsersRepository.instance.ge;
    userDataSource = AppUserDataSource(userData: users, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return ListCard(
        title: "AppUsers",
        // TODO: add delete function
        trailing: DataGridDeleteButton(
          dataGridController: dataGridController,
          deleteFunction: () {},
        ),
        list: ElementsDataGrid(
          dataSource: userDataSource,
          columnNames: ['name', 'manufacturer', 'category'],
          dataGridController: dataGridController,
        ));
  }
}

class AppUserDataSource extends DataGridSource {
  AppUserDataSource({required List<AppUser> userData, required this.context}) {
    _userData = userData
        .map<DataGridRow>((user) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'name', value: user.name),
              DataGridCell<String>(
                  columnName: 'manufacturer', value: user.name),
              DataGridCell<String>(columnName: 'category', value: user.email),
            ]))
        .toList();
  }

  List<DataGridRow> _userData = [];
  BuildContext context;

  @override
  List<DataGridRow> get rows => _userData;

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
