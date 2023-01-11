import 'package:ar_grocery_companion/models/user/user.dart';
import 'package:ar_grocery_companion/screens/authentication/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  TextEditingController dateController = TextEditingController();

  bool _isHidden = true;
  int groupValue = -1;

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
    print(groupValue);

    if (_formKey.currentState!.validate()) {
      //...create new user...//

      final docUser = FirebaseFirestore.instance.collection('users').doc();

      final json = {
        'name': "Steven!!!",
        'age': 21,
      };

      await docUser.set(json);

//set session
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
        color: Colors.white,
        child: ListView(children: [
          Center(
            child: customTitle(context: context, text: "Register"),
          ),
          customTextFormField(
            context: context,
            controller: emailController,
            errorMessage: 'Please enter your email.',
            regex:
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
            errorMessage2: "Email format is incorrect.",
            labelText: "Email",
            icon: Icons.mail,
          ),
          customTextFormField(
            context: context,
            controller: usernameController,
            errorMessage: 'Please enter your username.',
            labelText: "Username",
            icon: Icons.person,
            unique_username: true,
          ),
          customTextFormField(
            context: context,
            controller: passwordController,
            errorMessage: 'Please enter your password.',
            regex: "r'[!@#\$%^&*(),.?\":{}|<>]'",
            errorMessage2: 'Password must have a Special Character.',
            obscureText: _isHidden,
            labelText: "Password",
            toggle: _togglePasswordView,
            icon: (_isHidden ? Icons.visibility : Icons.visibility_off),
          ),
          customTextFormField(
              context: context,
              controller: confirmPasswordController,
              errorMessage: 'Please enter your password confirmation.',
              obscureText: _isHidden,
              labelText: "Password Confirmation",
              toggle: _togglePasswordView,
              icon: (_isHidden ? Icons.visibility : Icons.visibility_off),
              confirm: passwordController.text,
              errorMessage3: "Confirmation doesn't match password"),
          customTextFormField(
              context: context,
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
              customRadioButton(
                title: "Male",
                value: 2,
                groupValue: groupValue,
                onChanged: (newValue) => setState(() => groupValue = newValue!),
              ),
              customRadioButton(
                title: "Female",
                value: 1,
                groupValue: groupValue,
                onChanged: (newValue) => setState(() => groupValue = newValue!),
              ),
              customRadioButton(
                title: "Other",
                value: 0,
                groupValue: groupValue,
                onChanged: (newValue) => setState(() => groupValue = newValue!),
              ),
            ],
          ),
          Center(
            child: customAnimatedButton(
              context: context,
              text: 'Register',
              func: _register,
            ),
          ),
        ]),
      ),
    );
  }
}
