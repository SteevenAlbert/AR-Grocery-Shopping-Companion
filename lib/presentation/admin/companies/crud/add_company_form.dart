import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/presentation/admin/companies/crud/add_company_fields.dart';
import 'package:ar_grocery_companion/presentation/admin/components/image_adder.dart';
import 'package:ar_grocery_companion/domain/models/company.dart';
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

class AddCompanyForm extends StatefulWidget {
  const AddCompanyForm({super.key, required this.company, required this.add});
  final Company company;
  final bool add;

  @override
  State<AddCompanyForm> createState() => _AddCompanyFormState();
}

class _AddCompanyFormState extends State<AddCompanyForm> {
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final ImageAdder imageAdder = ImageAdder();
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
                  ImageAdder(
                    label: "Company logo",
                  ),
                  Expanded(
                      child: AddCompanyFields(
                          formKey: formKey,
                          company: widget.company,
                          add: widget.add)),
                ],
              );
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageAdder(
                    label: "Company logo",
                  ),
                  AddCompanyFields(
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
