import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
            color: Colors.black),
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
  bool unique_username = false,
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
        bool unique = false;
        if (unique_username) {
          () async {
            Future<bool> IsUserUnique() async {
              return await FirebaseFirestore.instance
                  .collection('users')
                  .where('name', isEqualTo: value)
                  .get()
                  .then((list) => list.size > 0 ? false : true);
            }

            (await IsUserUnique()) ? unique = false : unique = true;
          };
        }
        if (!unique) return "Username already taken.";
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
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        onPressed: func,
      ));
}
