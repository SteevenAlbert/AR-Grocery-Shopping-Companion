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
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(children: [
        Background2(),
        Container(
          margin: EdgeInsets.only(left: 15, top: 250, right: 15, bottom: 0),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0)),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                // spreadRadius: 25,
                spreadRadius: 200,
                blurRadius: 0,
                // offset: Offset(0, 0),
                offset: Offset(-30, -100),
              ),
            ],
          ),
          child: Stack(alignment: Alignment.center, children: [
            Container(
              margin: EdgeInsets.only(left: 35, top: 35, right: 35, bottom: 0),
              height: double.infinity,
              width: double.infinity,
              child: Form(
                key: _formKey,
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
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
                          borderSide:
                              BorderSide(width: 2, color: Colors.red.shade200),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
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
                          borderSide:
                              BorderSide(width: 2, color: Colors.red.shade200),
                        ),
                        suffix: InkWell(
                          onTap: _togglePasswordView,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              right: 8.0,
                            ),
                            child: Icon(
                              (_isHidden
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              color: Theme.of(context).primaryColor,
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
                          width: 275,
                          height: 57,
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
                            if (_formKey.currentState!.validate()) {
                              User? user =
                                  User.retrieveAccount(usernameController.text);
                              if (user == null) {
                              } else if (user.type == 0 || user.type == 0) {
                                await SessionManager()
                                    .set("name", user.username);
                                context.go('/admin_home_page');
                              } else if (user.type == 1 || user.type == 1) {
                                await SessionManager()
                                    .set("name", user.username);
                                context.go('/customer_home_page');
                              }
                            }
                          }),
                    ),
                  ),
                ]),
              ),
            ),
          ]),
        )
      ]),
    );
  }
}
