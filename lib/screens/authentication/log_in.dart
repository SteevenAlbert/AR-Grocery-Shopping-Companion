import 'package:ar_grocery_companion/models/user/user.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ar_grocery_companion/components/authentication/background1.dart';
import 'package:ar_grocery_companion/components/authentication/background2.dart';
import 'package:animated_button/animated_button.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  LogInScreenState createState() => LogInScreenState();
}

class LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKeyy = GlobalKey();
  TextEditingController usernameController = new TextEditingController();

  bool _isHidden = true;
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(shrinkWrap: false, children: [
        Center(
          child: Padding(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 10, left: 0, right: 0),
              child: Text(
                "Log In",
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
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 13,
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
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 10, bottom: 10, left: 15.0, right: 15.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 13,
            child: TextFormField(
              onChanged: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password.';
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
                suffix: InkWell(
                  onTap: _togglePasswordView,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                    ),
                    child: Icon(
                      (_isHidden ? Icons.visibility : Icons.visibility_off),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: AnimatedButton(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 13,
                color: Theme.of(context).primaryColor,
                child: Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onPressed: () async {
                  if (_formKeyy.currentState!.validate()) {
                    User? user = User.retrieveAccount(usernameController.text);
                    if (user == null) {
                    } else if (user.type == 0 || user.type == 0) {
                      await SessionManager().set("name", user.username);
                      context.go('/admin_home_page');
                    } else if (user.type == 1 || user.type == 1) {
                      await SessionManager().set("name", user.username);
                      context.go('/customer_home_page');
                    }
                  }
                }),
          ),
        ),
      ]),
    );
  }
}
