import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  CustomRadioButton(
      {Key? key,
      required this.title,
      required this.value,
      required this.groupValue,
      this.onChanged})
      : super(key: key);
  final String title;
  final int value;
  final int groupValue;
  final Function(int?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
        Text(title)
      ],
    );
  }
}
