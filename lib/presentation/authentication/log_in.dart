import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:go_router/go_router.dart';

import 'package:ar_grocery_companion/data/repositories/users_repository.dart';
import 'package:ar_grocery_companion/fire_auth.dart';
import 'package:ar_grocery_companion/presentation/components/custom_widgets/custom_animated_button.dart';
import 'package:ar_grocery_companion/presentation/components/custom_widgets/custom_text_form_field.dart';
import 'package:ar_grocery_companion/presentation/components/custom_widgets/custom_title.dart';

AppUsersRepository usersRepo = AppUsersRepository.instance;

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
      FireAuthentication.signInUsingEmailPassword(
        email: emailController.text,
        password: passwordController.text,
        context: context,
      ).then((user) async {
        print(user);
        if (user != null) {
          usersRepo
              .fetchAppUser((FirebaseAuth.instance.currentUser?.uid)!)
              .then((appUser) async {
            print(appUser);
            if (appUser != null) {
              var sessionManager = SessionManager();
              await sessionManager.set("UID", appUser.UID);
              await sessionManager.set("name", appUser.name);
              await sessionManager.set("pfpPath", appUser.pfpPath);
              await sessionManager.set("type", appUser.type);
              await sessionManager.set("isLoggedIn", true);
              ((await SessionManager().get("type") == 'customer')
                  ? context.go('/customer_homepage')
                  : context.go('/admin_homepage'));
            }
          });
        }
      });
    }
  }

  void _GooglelogIn() async {
    // User? user = await FireAuthentication.signInWithGoogle(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: Theme.of(context).canvasColor,
        child: ListView(shrinkWrap: false, children: [
          Center(child: CustomTitle(text: "Log In")),
          CustomTextFormField(
            controller: emailController,
            labelText: "Email",
            icon: Icons.mail,
            errorMessage: 'Please enter your email.',
            regex:
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
            regexErrorMessage: "Email format is incorrect.",
          ),
          CustomTextFormField(
            controller: passwordController,
            labelText: "Password",
            icon: (_isHidden ? Icons.visibility : Icons.visibility_off),
            errorMessage: 'Please enter your password.',
            obscureText: _isHidden,
            toggle: _togglePasswordView,
          ),
          Container(
            padding: EdgeInsets.only(right: 25.0, bottom: 10.0),
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () => {GoRouter.of(context).push('/forgot_password')},
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  // decoration: TextDecoration.underline,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Center(
              child: Column(
            children: [
              CustomAnimatedButton(
                  text: "Sign In",
                  textColor: Theme.of(context).canvasColor,
                  color: Theme.of(context).primaryColor,
                  func: _logIn),
              CustomAnimatedButton(
                  text: "Sign In with Google",
                  textColor: Theme.of(context).primaryColor,
                  color: Theme.of(context).selectedRowColor,
                  hasImage: true,
                  image: "assets/icon/google.png",
                  func: _GooglelogIn),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: InkWell(
                  onTap: () => {context.go('/customer_homepage')},
                  child: Text(
                    'Continue as a Guest',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          )),
        ]),
      ),
    );
  }
}
