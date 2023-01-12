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
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  bool _isHidden = true;
  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _logIn() async {
    if (_formKey.currentState!.validate()) {
      User? user = User.findEmailMatch(emailController.text);
      // User? user = User.fromJson();

      if (user == null) {
        //... email creds doesn't exist...//
      } else if (user.password != passwordController.text) {
        //... password wrong ...//
      } else {
        var sessionManager = SessionManager();

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
        color: Theme.of(context).canvasColor,
        child: ListView(shrinkWrap: false, children: [
          Center(child: customTitle(context: context, text: "Log In")),
          customTextFormField(
            context: context,
            controller: emailController,
            labelText: "Email",
            icon: Icons.mail,
            errorMessage: 'Please enter your email.',
            regex:
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
            errorMessage2: "Email format is incorrect.",
          ),
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
