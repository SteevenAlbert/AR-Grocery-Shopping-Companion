import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  String name;

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
        onPressed: () {},
        child: Text(this.name),
      ),
    );
  }
}
