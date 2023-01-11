import 'package:ar_grocery_companion/domain/models/user/user.dart';
import 'package:ar_grocery_companion/presentation/authentication/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  LogInScreenState createState() => LogInScreenState();
}

class LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool _isHidden = true;
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _logIn() async {
    if (_formKey.currentState!.validate()) {
      User? user = User.retrieveAccount(
          usernameController.text, passwordController.text);
      // User? user = User.fromJson();

      if (user == null) {
        //...validation error; wrong creds...//
      } else {
        var sessionManager = SessionManager();
        print("ALO");

        await sessionManager.set("type", user.type);
        await sessionManager.set("isLoggedIn", true);

        ((await SessionManager().get("type") == 1)
            ? context.go('/customer_homepage')
            : context.go('/admin_homepage'));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: Colors.white,
        child: ListView(shrinkWrap: false, children: [
          Center(child: customTitle(context: context, text: "Log In")),
          customTextFormField(
              context: context,
              controller: usernameController,
              labelText: "Username",
              icon: Icons.person,
              errorMessage: 'Please enter your username.'),
          customTextFormField(
            context: context,
            controller: passwordController,
            labelText: "Password",
            icon: (_isHidden ? Icons.visibility : Icons.visibility_off),
            errorMessage: 'Please enter your password.',
            obscureText: _isHidden,
            toggle: _togglePasswordView,
          ),
          Center(
              child: customAnimatedButton(
                  context: context, text: "Log In", func: _logIn)),
        ]),
      ),
    );
  }
}