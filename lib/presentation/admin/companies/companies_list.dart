import 'package:ar_grocery_companion/data/repositories/companies_repository.dart';
import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/presentation/admin/components/delete_button.dart';
import 'package:ar_grocery_companion/presentation/admin/components/element_datagrid.dart';
import 'package:ar_grocery_companion/presentation/admin/components/list_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CompaniesList extends StatefulWidget {
  const CompaniesList({super.key});
  @override
  State<CompaniesList> createState() => _CompaniesListState();
}

class _CompaniesListState extends State<CompaniesList> {
  List<Company> companies = <Company>[];
  late CompanyDataSource companyDataSource;
  final DataGridController dataGridController = DataGridController();
  CompaniesRepository companiesrepo = CompaniesRepository.instance;
  @override
  void initState() {
    super.initState();
    companies = CompaniesRepository.instance.getCompanies();
    companyDataSource =
        CompanyDataSource(companyData: companies, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return ListCard(
      title: "Companies",
      trailing: DataGridDeleteButton(
        dataGridController: dataGridController,
        deleteFunction: () {
          for (var i = 0; i < dataGridController.selectedRows.length; i++) {
            Company company = companies.firstWhere((element) =>
                element.name ==
                dataGridController.selectedRows[i].getCells()[0].value);
            companiesrepo.deleteByID(company.id);
          }
        },
      ),
      list: ElementsDataGrid(
        dataSource: companyDataSource,
        columnNames: ['name', 'origin', 'edit'],
        dataGridController: dataGridController,
      ),
    );
  }
}

class CompanyDataSource extends DataGridSource {
  CompanyDataSource(
      {required List<Company> companyData, required this.context}) {
    _companyData = companyData
        .map<DataGridRow>((company) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'name', value: company.name),
              DataGridCell<String>(
                  columnName: 'origin',
                  value: company.origin?.name ?? "None"),
              DataGridCell<Function>(
                  columnName: 'edit',
                  value: () {
                    context.push('/edit_company_page', extra: company);
                  }),
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
