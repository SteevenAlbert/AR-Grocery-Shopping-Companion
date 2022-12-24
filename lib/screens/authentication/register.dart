import 'package:ar_grocery_companion/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ar_grocery_companion/components/authentication/background1.dart';
import 'package:ar_grocery_companion/components/authentication/background2.dart';
import 'package:animated_button/animated_button.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController usernameController = new TextEditingController();

  bool _isHidden = true;
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: Colors.white,
        child: ListView(children: [
          Center(
            child: Padding(
                padding:
                    EdgeInsets.only(top: 10, bottom: 20, left: 15, right: 15),
                child: Text(
                  "Register",
                  style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 10, bottom: 10, left: 15.0, right: 15.0),
            child: TextFormField(
              controller: usernameController,
              onChanged: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email.';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: TextStyle(
                  color: Theme.of(context).hintColor.withOpacity(0.5),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(width: 2, color: Colors.red.shade200),
                ),
                suffixIcon: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Icon(
                      Icons.mail,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 10, bottom: 10, left: 15.0, right: 15.0),
            child: TextFormField(
              controller: usernameController,
              onChanged: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your username.';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Username",
                hintStyle: TextStyle(
                  color: Theme.of(context).hintColor.withOpacity(0.5),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(width: 2, color: Colors.red.shade200),
                ),
                suffixIcon: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 10, bottom: 10, left: 15.0, right: 15.0),
            child: TextFormField(
              onChanged: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password.';
                } else if (!value
                    .contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                  return 'Password must have a Special Character.';
                }
                return null;
              },
              obscureText: _isHidden,
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Theme.of(context).hintColor.withOpacity(0.5),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(width: 2, color: Colors.red.shade200),
                ),
                suffixIcon: InkWell(
                  onTap: _togglePasswordView,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: Icon(
                      (_isHidden ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, bottom: 15.0, left: 15.0, right: 15.0),
              child: AnimatedButton(
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 13,
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      //..create new user//
                      await SessionManager()
                          .set("name", usernameController.text);
                      context.go('/customer_home_page');
                    }
                  }),
            ),
          ),
        ]),
      ),
    );
  }
}
