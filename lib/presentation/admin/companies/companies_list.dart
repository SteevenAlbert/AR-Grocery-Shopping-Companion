import 'package:ar_grocery_companion/data/repositories/companies_repository.dart';
import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/presentation/admin/components/element_datagrid.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class CompaniesList extends StatefulWidget {
  const CompaniesList({super.key});

  @override
  State<CompaniesList> createState() => _CompaniesListState();
}

class _CompaniesListState extends State<CompaniesList> {
  List<Company> companies = <Company>[];
  late CompanyDataSource companyDataSource;

  @override
  void initState() {
    super.initState();
    companies = CompaniesRepository.instance.getCompanies();
    companyDataSource = CompanyDataSource(companyData: companies, context: context);
  }

  @override
  Widget build(BuildContext context) {
    return ElementsDataGrid(dataSource: companyDataSource, columnNames: ['name', 'country']);
  }
}

class CompanyDataSource extends DataGridSource {
  CompanyDataSource({required List<Company> companyData, required  this.context}) {
    _companyData = companyData
        .map<DataGridRow>((company) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'name', value: company.name),
              DataGridCell<String>(
                  columnName: 'country', value: company.country?.name??"None"),
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
        child: Text(e.value.toString(), style: Theme.of(context).textTheme.labelLarge),
      );
    }).toList());
  }
}
