import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatelessWidget {
  const CustomAnimatedButton({
    Key? key,
    required this.text,
    required this.func,
  }) : super(key: key);
  final String text;
  final Function() func;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: AnimatedButton(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 13,
          color: Theme.of(context).primaryColor,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 23,
              color: Theme.of(context).canvasColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: func,
        ));
  }
}
