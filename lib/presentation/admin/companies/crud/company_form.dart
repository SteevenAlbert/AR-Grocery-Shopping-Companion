import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/presentation/admin/companies/crud/company_fields.dart';
import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/presentation/components/image_adder.dart';

// class ImageToUpload with ChangeNotifier {
//   String name;
//   String path;
//   ImageToUpload({required this.name, required this.path});
//   void setImage(String name, String path) {
//     name = name;
//     path = path;
//     notifyListeners();
//   }
// }

class CompanyForm extends StatefulWidget {
  const CompanyForm({super.key, required this.company, required this.add});
  final Company company;
  final bool add;

  @override
  State<CompanyForm> createState() => _CompanyFormState();
}

class _CompanyFormState extends State<CompanyForm> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    //TODO: handle imageAdder callback
    // final ImageAdder imageAdder = ImageAdder();
    return Form(
      key: formKey,
      // child: ChangeNotifierProvider(
      //   create: (_) => ImageToUpload(name: "", path: ""),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // ImageAdder(
                  //   label: "Company logo",
                  // ),
                  Expanded(
                      child: CompanyFields(
                          formKey: formKey,
                          company: widget.company,
                          add: widget.add)),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ImageAdder(
                  //   label: "Company logo",
                  // ),
                  CompanyFields(
                      formKey: formKey,
                      company: widget.company,
                      add: widget.add)
                ],
              );
            }
          },
        ),
      ),
      // ),
    );
  }
}
