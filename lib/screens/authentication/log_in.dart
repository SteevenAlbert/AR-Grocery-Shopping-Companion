import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ar_grocery_companion/components/authentication/background.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: CustomBackground(
          child: Center(
              child: TextButton(
                  child: Text("Sign In"),
                  onPressed: () => context.go('/home')))),
    );
  }
}
