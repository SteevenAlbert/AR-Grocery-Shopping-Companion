import 'package:ar_grocery_companion/domain/models/user/app_user.dart';
import 'package:ar_grocery_companion/presentation/admin/components/image_adder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:ar_grocery_companion/data/repositories/users_repository.dart';
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

  int groupValue = -1;

  @override
  void initState() {
    nameController.text = widget.appUser.name;
    dateController.text = widget.appUser.DOB;
    groupValue = widget.appUser.gender == 'other'
        ? 0
        : (widget.appUser.gender == 'female' ? 1 : 2);

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

  void _editProfile() async {
    if (_formKey.currentState!.validate()) {
      // name: nameController.text,
      // DOB: dateController.text,
      // gender: groupValue == 0
      //     ? "other"
      //     : (groupValue == 1 ? "female" : "male")
      usersRepo.updateAppUser().then((success) async {
        if (success == true) {
          // var sessionManager = SessionManager();
          // await sessionManager.set("name", appUser.name);
          // await sessionManager.set("pfpPath", appUser.pfpPath);

          //success popup
        } else {
//error page

        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.only(top: 15),
        color: Theme.of(context).canvasColor,
        child: ListView(children: [
          Center(
            child: ImageAdder(
              radius: 400.0,
              // widget.appUser.pfpPath
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
            padding:
                const EdgeInsets.only(top: 9, bottom: 0, left: 27.0, right: 0),
            child: Text(
              "Gender",
              style:
                  TextStyle(color: Theme.of(context).hintColor, fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadioButton(
                title: "Male",
                value: 2,
                groupValue: groupValue,
                onChanged: (newValue) => setState(() => groupValue = newValue!),
              ),
              CustomRadioButton(
                title: "Female",
                value: 1,
                groupValue: groupValue,
                onChanged: (newValue) => setState(() => groupValue = newValue!),
              ),
              CustomRadioButton(
                title: "Other",
                value: 0,
                groupValue: groupValue,
                onChanged: (newValue) => setState(() => groupValue = newValue!),
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
  }
}
