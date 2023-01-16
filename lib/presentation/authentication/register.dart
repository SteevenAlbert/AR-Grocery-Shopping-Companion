import 'package:ar_grocery_companion/data/helpers/db_helper.dart';
import 'package:ar_grocery_companion/presentation/authentication/custom_widgets/custom_animated_button.dart';
import 'package:ar_grocery_companion/presentation/authentication/custom_widgets/custom_radio_button.dart';
import 'package:ar_grocery_companion/presentation/authentication/custom_widgets/custom_text_form_field.dart';
import 'package:ar_grocery_companion/presentation/authentication/custom_widgets/custom_title.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ar_grocery_companion/constants/constants.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:intl/intl.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  TextEditingController dateController = TextEditingController();

  bool _isHidden = true;
  int groupValue = -1;
  bool isLoading = false;
  bool isUnique = true;

  @override
  void initState() {
    dateController.text = "";
    super.initState();
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
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

  void _register() async {
    if (_formKey.currentState!.validate()) {
      //TODO: create new user
// DateTime.now().year-dateController.year
//if groupValue == 0 other, == 1 female, == 2 male
      //write json data to firebase

      //TODO: set session
      // ((await SessionManager().get("type") == 1)
      //     ? context.go('/customer_homepage')
      //     : context.go('/admin_homepage'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: Theme.of(context).canvasColor,
        child: ListView(children: [
          Center(
            child: CustomTitle(text: "Register"),
          ),
          CustomTextFormField(
            controller: nameController,
            errorMessage: 'Please enter your name.',
            labelText: "Name",
            icon: Icons.person,
          ),
          CustomTextFormField(
            controller: emailController,
            errorMessage: 'Please enter your email.',
            regex:
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
            errorMessage2: "Email format is incorrect.",
            labelText: "Email",
            icon: Icons.mail,
          ),
          CustomTextFormField(
            controller: passwordController,
            errorMessage: 'Please enter your password.',
            regex: "r'[!@#\$%^&*(),.?\":{}|<>]'",
            errorMessage2: 'Password must have a Special Character.',
            obscureText: _isHidden,
            labelText: "Password",
            toggle: _togglePasswordView,
            icon: (_isHidden ? Icons.visibility : Icons.visibility_off),
          ),
          CustomTextFormField(
              controller: confirmPasswordController,
              errorMessage: 'Please enter your password confirmation.',
              obscureText: _isHidden,
              labelText: "Password Confirmation",
              toggle: _togglePasswordView,
              icon: (_isHidden ? Icons.visibility : Icons.visibility_off),
              confirm: passwordController.text,
              errorMessage3: "Confirmation doesn't match password"),
          CustomTextFormField(
              controller: dateController,
              labelText: "Date of Birth",
              icon: Icons.calendar_today,
              errorMessage: "Please enter Date of Birth",
              readOnly: true,
              onTap: datePicker),
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
              text: 'Register',
              func: _register,
            ),
          ),
        ]),
      ),
    );
  }
}
