import 'package:ar_grocery_companion/firebase_storage.dart';
import 'package:ar_grocery_companion/presentation/components/custom_widgets/custom_awesome_snackbar.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:ar_grocery_companion/data/repositories/users_repository.dart';
import 'package:ar_grocery_companion/domain/models/user/app_user.dart';
import 'package:ar_grocery_companion/presentation/components/image_adder.dart';
import 'package:ar_grocery_companion/presentation/components/custom_widgets/custom_animated_button.dart';
import 'package:ar_grocery_companion/presentation/components/custom_widgets/custom_radio_button.dart';
import 'package:ar_grocery_companion/presentation/components/custom_widgets/custom_text_form_field.dart';

AppUsersRepository usersRepo = AppUsersRepository.instance;

class ProfilePageForm extends StatefulWidget {
  const ProfilePageForm({super.key, required this.appUser});
  final AppUser appUser;

  @override
  ProfilePageFormState createState() => ProfilePageFormState();
}

class ProfilePageFormState extends State<ProfilePageForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController nameController = new TextEditingController();
  TextEditingController dateController = TextEditingController();
  late String pfpPath;
  late int groupValue;

  @override
  void initState() {
    nameController.text = widget.appUser.name;
    dateController.text = widget.appUser.DOB ?? "";
    groupValue = widget.appUser.gender == 'other'
        ? 0
        : (widget.appUser.gender == 'female'
            ? 1
            : (widget.appUser.gender == 'male' ? 2 : -1));
    pfpPath = widget.appUser.pfpPath!;
    super.initState();
  }

  void datePicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1940),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        dateController.text = formattedDate;
      });
    }
  }

  updatePfp(String newPfpPath) {
    this.pfpPath = newPfpPath;
  }

  void _editProfile() async {
    if (_formKey.currentState!.validate()) {
      String pfpName = this.pfpPath.split('/').last;

      // (() async {
      if (!(pfpName == widget.appUser.pfpPath)) {
        // return
        await FireStorage.uploadFile(
            uploadPath: "images/profile_pictures/${pfpName}",
            filePath: this.pfpPath);
      }
      // }).then((_) {
      widget.appUser.name = nameController.text;
      widget.appUser.DOB = dateController.text;
      widget.appUser.gender = (groupValue == 0
          ? "other"
          : (groupValue == 1 ? "female" : (groupValue == 2 ? "male" : "")));
      widget.appUser.pfpPath = pfpName;

      usersRepo.updateAppUser(appUser: widget.appUser).then((success) async {
        print(success);
        if (success) {
          print(SessionManager().toString());
          await SessionManager().set("name", widget.appUser.name);
          await SessionManager()
              .set("pfpPath", widget.appUser.pfpPath)
              .then((_) => print("ALOOO"));
          await SessionManager().update().then((_) => CustomAwesomeSnackbar(
              context: context,
              title: "Successful!",
              message: "your profile details have been updated succesfully.",
              contentType: ContentType.success));
        }
      });
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    //
    return new FutureBuilder(
        future: FireStorage.getUrl("/images/profile_pictures/$pfpPath"),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.only(top: 15),
                color: Theme.of(context).canvasColor,
                child: ListView(children: [
                  Center(
                    child: ImageAdder(
                      label: "Profile Picture",
                      url: snapshot.data,
                      radius: 300.0,
                      onImageUpload: updatePfp,
                    ),
                  ),
                  CustomTextFormField(
                    enabled: false,
                    labelText: "Email",
                    icon: Icons.mail,
                    initialValue: widget.appUser.email,
                    fillColor: Theme.of(context).hoverColor,
                  ),
                  CustomTextFormField(
                    controller: nameController,
                    errorMessage: 'Name can\'t be empty.',
                    labelText: "Name",
                    icon: Icons.person,
                  ),
                  CustomTextFormField(
                    controller: dateController,
                    labelText: "Date of Birth",
                    icon: Icons.calendar_today,
                    errorMessage: "Date of Birth can't be empty",
                    readOnly: true,
                    onTap: datePicker,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 9, bottom: 0, left: 27.0, right: 0),
                    child: Text(
                      "Gender",
                      style: TextStyle(
                          color: Theme.of(context).hintColor, fontSize: 16),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomRadioButton(
                        title: "Male",
                        value: 2,
                        groupValue: groupValue,
                        onChanged: (newValue) =>
                            setState(() => groupValue = newValue!),
                      ),
                      CustomRadioButton(
                        title: "Female",
                        value: 1,
                        groupValue: groupValue,
                        onChanged: (newValue) =>
                            setState(() => groupValue = newValue!),
                      ),
                      CustomRadioButton(
                        title: "Other",
                        value: 0,
                        groupValue: groupValue,
                        onChanged: (newValue) =>
                            setState(() => groupValue = newValue!),
                      ),
                    ],
                  ),
                  Center(
                    child: CustomAnimatedButton(
                      text: 'Save',
                      textColor: Theme.of(context).canvasColor,
                      color: Theme.of(context).primaryColor,
                      func: _editProfile,
                    ),
                  ),
                ]),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          } else {
            return Center(child: const CircularProgressIndicator());
          }
        });
  }
}
