import 'package:ar_grocery_companion/constants/constants.dart';
import 'package:ar_grocery_companion/data/repositories/companies_repository.dart';
import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CompaniesListPage extends ConsumerWidget {
  const CompaniesListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<List<Company>> companies =
        ref.watch(CompaniesRepository.instance.companiesListFutureProvider);
    return Scaffold(
      appBar: buildAppBar(context: context, title: "Manufacturers"),
      body: FutureBuilder(
          future: companies,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index) {
                  Company currCompany = snapshot.data![index];
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Theme.of(context).canvasColor.withOpacity(0.1),
                        child: Image.asset(
                          currCompany.logoPath ?? kNoLogoImg,
                        )),
                    title: Text(currCompany.name),
                    onTap: () =>
                        context.push("/company_details", extra: currCompany),
                  );
                }),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          })),
    );
  }
}
