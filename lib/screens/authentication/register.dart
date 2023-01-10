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
  TextEditingController usernameController = new TextEditingController();

  bool _isHidden = true;

  @override
  void initState() {
    dateinput.text = "";
    super.initState();
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  TextEditingController dateinput = TextEditingController();

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
        dateinput.text = formattedDate;
      });
    }
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      //...create new user...//

      final docUser = FirebaseFirestore.instance.collection('users').doc();

      //to json
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
            errorMessage: 'Please enter your email.',
            labelText: "Email",
            icon: Icons.mail,
          ),
          customTextFormField(
            context: context,
            controller: usernameController,
            errorMessage: 'Please enter your username.',
            labelText: "Username",
            icon: Icons.person,
          ),
          customTextFormField(
            context: context,
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
              labelText: "Date of Birth",
              icon: Icons.calendar_today,
              errorMessage: "Please enter Date of Birth",
              controller: dateinput,
              readOnly: true,
              onTap: datePicker),
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
