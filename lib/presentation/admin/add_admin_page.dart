import 'package:ar_grocery_companion/presentation/authentication/register.dart';
import 'package:flutter/material.dart';

class AddAdminPage extends StatelessWidget {
  const AddAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          foregroundColor: Theme.of(context).primaryColor,
        ),
        body: RegisterScreen(type: 'admin'));
  }
}
