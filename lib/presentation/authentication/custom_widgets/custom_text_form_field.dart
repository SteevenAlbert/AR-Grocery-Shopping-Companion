import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    Key? key,
    required this.labelText,
    required this.icon,
    this.controller,
    required this.errorMessage,
    this.regex = "(.*?)",
    this.errorMessage2 = "",
    this.confirm,
    this.errorMessage3 = "",
    this.errorMessage4 = "",
    this.obscureText = false,
    this.toggle,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);
  final String labelText;
  final IconData icon;
  final TextEditingController? controller;
  final String errorMessage;
  final String? regex;
  final String? errorMessage2;
  final String? confirm;
  final String? errorMessage3;
  final String? errorMessage4;
  final bool? obscureText;
  final Function()? toggle;
  final bool? readOnly;
  final Function()? onTap;
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 9, bottom: 9, left: 15.0, right: 15.0),
      child: TextFormField(
        // autovalidateMode: AutovalidateMode.always,
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return errorMessage;
          } else if (!value.contains(new RegExp(regex!))) {
            return errorMessage2;
          }

          if (confirm != null) {
            if (value != confirm) {
              return errorMessage3;
            }
          }

          return null;
        },
        obscureText: obscureText!,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          suffixIcon: InkWell(
            onTap: toggle,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                right: 8.0,
              ),
              child: Icon(
                icon,
              ),
            ),
          ),
        ),
        onTap: onTap,
        readOnly: readOnly!,
      ),
    );
  }
}
