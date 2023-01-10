import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';

Widget customTitle({
  required BuildContext context,
  required String text,
}) {
  return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 20, left: 15, right: 15),
      child: Text(
        text,
        style: TextStyle(
            fontFamily: "Ubuntu",
            fontSize: 33,
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ));
}

Widget customTextFormField({
  required BuildContext context,
  required String labelText,
  required IconData icon,
  required String errorMessage,
  String? regex = "(.*?)",
  String? errorMessage2 = "",
  TextEditingController? controller,
  bool? obscureText = false,
  void Function()? toggle,
  bool? readOnly = false,
  void Function()? onTap,
}) {
  return Padding(
    padding:
        const EdgeInsets.only(top: 10, bottom: 10, left: 15.0, right: 15.0),
    child: TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorMessage;
        } else if (!value.contains(new RegExp(regex!))) {
          return errorMessage2;
        }
        return null;
      },
      obscureText: obscureText!,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.0,
            color: Theme.of(context).primaryColorDark,
          ),
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

//--------------------------------------------------------------------------------------------//

Widget customAnimatedButton({
  required BuildContext context,
  required String text,
  required void func(),
}) {
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
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: func,
      ));
}
