// import 'package:ar_grocery_companion/components/authentication/background1.dart';
// import 'package:ar_grocery_companion/components/authentication/background2.dart';
import 'package:ar_grocery_companion/domain/models/user/user.dart';
import 'package:ar_grocery_companion/presentation/authentication/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:flutter_session_manager/flutter_session_manager.dart';

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

  void _logIn() async {
    if (_formKey.currentState!.validate()) {
      User? user = User.retrieveAccount(usernameController.text);
      if (user == null) {
        //...validation error...//
      } else if (user.type == 0 || user.type == 0) {
        //...set session (admin)...//
        // await SessionManager().set("name", user.username);
        context.go('/admin_home_page');
      } else if (user.type == 1 || user.type == 1) {
        //...set session (customer)...//
        // await SessionManager().set("name", user.username);
        context.go('/customer_home_page');
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
