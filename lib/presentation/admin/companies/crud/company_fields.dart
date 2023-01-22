import 'package:ar_grocery_companion/domain/models/origin.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:ar_grocery_companion/data/repositories/companies_repository.dart';
import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:go_router/go_router.dart';
import 'package:country_picker/src/utils.dart';
import 'package:ar_grocery_companion/firebase_storage.dart';
import 'package:ar_grocery_companion/presentation/components/image_adder.dart';

CompaniesRepository companies = CompaniesRepository.instance;

class CompanyFields extends StatefulWidget {
  CompanyFields(
      {super.key,
      required this.formKey,
      required this.add,
      required this.company,
      required this.constraints});
  final bool add;
  final Company company;
  final GlobalKey<FormState> formKey;
  final BoxConstraints constraints;
  @override
  State<CompanyFields> createState() => _CompanyFieldsState();
}

class _CompanyFieldsState extends State<CompanyFields> {
  late String countryInfo = widget.add
      ? Country.worldWide.flagEmoji + " Choose Country"
      : Utils.countryCodeToEmoji(widget.company.origin!.countryCode) +
          " " +
          widget.company.origin!.name +
          " (${widget.company.origin!.countryCode})";
  late String countryCode = widget.add
      ? Country.worldWide.countryCode
      : widget.company.origin!.countryCode;
  late String countryName =
      widget.add ? Country.worldWide.name : widget.company.origin!.name;
  late String name = widget.add ? '' : widget.company.name;
  late String url = widget.add ? '' : widget.company.url!;
  late String? logoPath;
  @override
  void initState() {
    logoPath = widget.company.logoPath;
    super.initState();
  }

  updateLogoPath(String newlogoPath) async {
    this.logoPath = newlogoPath.split('/').last;
    await FireStorage.uploadFile(
        uploadPath: "images/companies_pictures/${logoPath}",
        filePath: newlogoPath);
  }

  @override
  Widget build(BuildContext context) {
    return widget.constraints.maxWidth > 600
        ? Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.add || logoPath == null
                        ? ImageAdder(
                            label: "Company Logo",
                            radius: 300.0,
                            onImageUpload: updateLogoPath,
                          )
                        : FutureBuilder(
                            future: FireStorage.getUrl(
                                "/images/companies_pictures/$logoPath"),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ImageAdder(
                                  label: "Company Logo",
                                  url: snapshot.data,
                                  radius: 300.0,
                                  onImageUpload: updateLogoPath,
                                );
                              } else if (snapshot.hasError) {
                                return Center(child: Text("${snapshot.error}"));
                              } else {
                                return Center(
                                    child: const CircularProgressIndicator());
                              }
                            }),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                      initialValue: name,
                      onChanged: (String? newValue) {
                        setState(() {
                          name = newValue!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the company name';
                        }
                        if (value.length >= 15) {
                          return 'The name should be at most 15 characters';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'URL',
                      ),
                      initialValue: url,
                      onChanged: (String? newValue) {
                        setState(() {
                          url = newValue!;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the company url';
                        }
                        if (!isURL(value)) {
                          return 'The url is not valid';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    FormField(
                      builder: ((field) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Text(countryInfo),
                                trailing: Icon(Icons.arrow_drop_down),
                                onTap: () {
                                  showCountryPicker(
                                    context: context,
                                    onSelect: (Country country) {
                                      setState(() {
                                        countryInfo = country.flagEmoji +
                                            " " +
                                            country.displayNameNoCountryCode;
                                        countryCode = country.countryCode;
                                        countryName = country.name;
                                        field.setValue(countryInfo);
                                      });
                                    },
                                  );
                                },
                              ),
                              Text(
                                field.errorText ?? "",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: Colors.red[700]),
                              ),
                            ],
                          )),
                      validator: (value) {
                        if (value == null) {
                          return 'Please choose a country';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ButtonBar(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (widget.formKey.currentState!.validate()) {
                                Company company = widget.company.copyWith(
                                    name: name,
                                    origin: Origin(
                                        name: countryName,
                                        countryCode: countryCode),
                                    url: url,
                                    logoPath: logoPath);
                                widget.add
                                    ? companies.insert(company)
                                    : companies.update(company);
                                context.go('/admin_homepage');
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ])
        : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.add || logoPath == null
                      ? ImageAdder(
                          label: "Company Logo",
                          radius: 300.0,
                          onImageUpload: updateLogoPath,
                        )
                      : FutureBuilder(
                          future: FireStorage.getUrl(
                              "/images/companies_pictures/$logoPath"),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ImageAdder(
                                label: "Company Logo",
                                url: snapshot.data,
                                radius: 300.0,
                                onImageUpload: updateLogoPath,
                              );
                            } else if (snapshot.hasError) {
                              return Center(child: Text("${snapshot.error}"));
                            } else {
                              return Center(
                                  child: const CircularProgressIndicator());
                            }
                          }),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                    ),
                    initialValue: name,
                    onChanged: (String? newValue) {
                      setState(() {
                        name = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the company name';
                      }
                      if (value.length >= 15) {
                        return 'The name should be at most 15 characters';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'URL',
                    ),
                    initialValue: url,
                    onChanged: (String? newValue) {
                      setState(() {
                        url = newValue!;
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the company url';
                      }
                      if (!isURL(value)) {
                        return 'The url is not valid';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  FormField(
                    builder: ((field) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ListTile(
                              title: Text(countryInfo),
                              trailing: Icon(Icons.arrow_drop_down),
                              onTap: () {
                                showCountryPicker(
                                  context: context,
                                  onSelect: (Country country) {
                                    setState(() {
                                      countryInfo = country.flagEmoji +
                                          " " +
                                          country.displayNameNoCountryCode;
                                      countryCode = country.countryCode;
                                      countryName = country.name;
                                      field.setValue(countryInfo);
                                    });
                                  },
                                );
                              },
                            ),
                            Text(
                              field.errorText ?? "",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(color: Colors.red[700]),
                            ),
                          ],
                        )),
                    validator: (value) {
                      if (value == null) {
                        return 'Please choose a country';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ButtonBar(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (widget.formKey.currentState!.validate()) {
                              Company company = widget.company.copyWith(
                                  name: name,
                                  origin: Origin(
                                      name: countryName,
                                      countryCode: countryCode),
                                  url: url,
                                  logoPath: logoPath);
                              widget.add
                                  ? companies.insert(company)
                                  : companies.update(company);
                              context.go('/admin_homepage');
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]);
  }
}
