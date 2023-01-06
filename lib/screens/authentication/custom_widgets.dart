import 'package:flutter/material.dart';

Widget customTextFormField({
  required BuildContext context,
  required String hintText,
  required IconData icon,
  required String errorMessage,
  TextEditingController? controller,
  bool? obscureText,
  void Function()? toggle,
}) {
  return TextFormField(
    controller: controller,
    onChanged: (value) {},
    validator: (value) {
      if (value == null || value.isEmpty) {
        return errorMessage;
      }
      return null;
    },
    obscureText: obscureText!, //---
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: Theme.of(context).hintColor.withOpacity(0.5),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          width: 1.0,
          color: Theme.of(context).primaryColorDark,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(width: 2, color: Colors.red.shade200),
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
            // color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    ),
  );
}
