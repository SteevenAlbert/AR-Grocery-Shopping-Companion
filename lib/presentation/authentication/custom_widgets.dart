import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget customTitle({
  required BuildContext context,
  required String text,
}) {
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

Widget customTextFormField({
  required BuildContext context,
  required String labelText,
  required IconData icon,
  TextEditingController? controller,
  required String errorMessage,
  String? regex = "(.*?)",
  String? errorMessage2 = "",
  String? confirm,
  String? errorMessage3 = "",
  String? errorMessage4 = "",
  bool? obscureText = false,
  void Function()? toggle,
  bool? readOnly = false,
  void Function()? onTap,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 9, bottom: 9, left: 15.0, right: 15.0),
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

//--------------------------------------------------------------------------------------------//

Widget customRadioButton(
    {required String title,
    required int value,
    required int groupValue,
    void Function(int?)? onChanged}) {
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
            color: Theme.of(context).canvasColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: func,
      ));
}
