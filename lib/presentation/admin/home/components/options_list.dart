import 'package:ar_grocery_companion/presentation/admin/home/components/option.dart';
import 'package:flutter/material.dart';

class OptionsList extends StatelessWidget {
  const OptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Option(name:"Products"),
        ],
      ),
    );
  }
}