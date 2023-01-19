import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {Key? key,
      required this.labelText,
      this.initialValue,
      required this.icon,
      this.controller,
      this.errorMessage,
      this.regex = "(.*?)",
      this.regexErrorMessage = "",
      this.confirm,
      this.confirmErrorMessage = "",
      this.obscureText = false,
      this.toggle,
      this.readOnly = false,
      this.enabled = true,
      this.onTap,
      this.fillColor})
      : super(key: key);
  final String labelText;
  final String? initialValue;
  final IconData icon;
  final TextEditingController? controller;
  final String? errorMessage;
  final String? regex;
  final String? regexErrorMessage;
  final TextEditingController? confirm;
  final String? confirmErrorMessage;
  final bool? obscureText;
  final Function()? toggle;
  final bool? readOnly;
  final bool? enabled;
  final Function()? onTap;
  final Color? fillColor;
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
            return regexErrorMessage;
          } else if (confirm != null && value != confirm!.text) {
            return confirmErrorMessage;
          }
          return null;
        },
        obscureText: obscureText!,
        initialValue: initialValue,
        decoration: InputDecoration(
          filled: fillColor == null ? false : true,
          fillColor: fillColor,
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
        enabled: enabled,
      ),
    );
  }
}
