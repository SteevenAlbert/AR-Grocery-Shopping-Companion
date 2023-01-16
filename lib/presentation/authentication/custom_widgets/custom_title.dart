import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 0, bottom: 13, left: 0, right: 0),
        child: Text(
          text,
          style: TextStyle(
              fontFamily: "Ubuntu",
              fontSize: 33,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).secondaryHeaderColor),
        ));
  }
}
