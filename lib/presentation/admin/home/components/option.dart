import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Option extends StatelessWidget {
  final String name;

  Option({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Theme.of(context).primaryColor),
          shape: const StadiumBorder(),
        ),
        onPressed:  () => GoRouter.of(context).push('/products_dashboard'),
        child: Text(this.name),
      ),
    );
  }
}
