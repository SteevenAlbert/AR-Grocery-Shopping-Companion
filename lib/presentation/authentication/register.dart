import 'package:ar_grocery_companion/domain/models/user/app_user.dart';
import 'package:ar_grocery_companion/firebase_authentication.dart';
import 'package:ar_grocery_companion/presentation/components/custom_widgets/custom_animated_button.dart';
import 'package:ar_grocery_companion/presentation/components/custom_widgets/custom_radio_button.dart';
import 'package:ar_grocery_companion/presentation/components/custom_widgets/custom_text_form_field.dart';
import 'package:ar_grocery_companion/presentation/components/custom_widgets/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:intl/intl.dart';
import 'package:ar_grocery_companion/data/repositories/users_repository.dart';

AppUsersRepository usersRepo = AppUsersRepository.instance;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.type});
  final String type;

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController emailController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  TextEditingController dateController = TextEditingController();

  bool _isHidden = true;
  bool _isConfirmHidden = true;
  int groupValue = 0;
  bool isLoading = false;
  bool isUnique = true;

  @override
  void initState() {
    dateController.text = "";
    super.initState();
  }

  void _togglePasswordView1() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _toggleConfirmPasswordView() {
    setState(() {
      _isConfirmHidden = !_isConfirmHidden;
    });
  }

  void datePicker() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1940),
        lastDate: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day));
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        dateController.text = formattedDate;
      });
    }
  }

  void _register() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (_formKey.currentState!.validate()) {
      FirebaseAuthentication.registerUsingEmailPassword(
              context: context,
              email: emailController.text,
              password: passwordController.text)
          .then((user) {
        if (user != null) {
          AppUser appUser = AppUser(
              UID: user.uid,
              email: emailController.text,
              name: nameController.text,
              type: widget.type,
              DOB: dateController.text,
              gender: groupValue == 0
                  ? "other"
                  : (groupValue == 1 ? "female" : "male"));
          usersRepo.insertAppUser(appUser: appUser).then((success) async {
            if (success == true) {
              var sessionManager = SessionManager();
              await sessionManager.set("UID", appUser.UID);
              await sessionManager.set("name", appUser.name);
              await sessionManager.set("pfpPath", appUser.pfpPath);
              await sessionManager.set("type", appUser.type);
              await sessionManager.set("isLoggedIn", true);

              context.go('/customer_homepage');
            } else {
              user.delete();
            }
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        color: Theme.of(context).canvasColor,
        child: ListView(children: [
          Center(
            child: CustomTitle(
                text: widget.type == 'customer' ? "Register" : "Add New Admin"),
          ),
          CustomTextFormField(
            controller: nameController,
            errorMessage: 'Please enter your name.',
            labelText: "Name",
            icon: Icons.person,
          ),
          CustomTextFormField(
            controller: emailController,
            errorMessage: 'Please enter your email.',
            regex:
                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
            regexErrorMessage: "Email format is incorrect.",
            labelText: "Email",
            icon: Icons.mail,
          ),
          CustomTextFormField(
            controller: passwordController,
            errorMessage: 'Please enter your password.',
            regex:
                r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{6,}$',
            regexErrorMessage:
                'Password must be more than 6 characters and have a Special Character.',
            obscureText: _isHidden,
            labelText: "Password",
            toggle: _togglePasswordView1,
            icon: (_isHidden ? Icons.visibility : Icons.visibility_off),
          ),
          CustomTextFormField(
              controller: confirmPasswordController,
              errorMessage: 'Please enter your password confirmation.',
              obscureText: _isConfirmHidden,
              labelText: "Password Confirmation",
              toggle: _toggleConfirmPasswordView,
              icon:
                  (_isConfirmHidden ? Icons.visibility : Icons.visibility_off),
              confirm: passwordController,
              confirmErrorMessage: "Confirmation doesn't match password"),
          CustomTextFormField(
              controller: dateController,
              labelText: "Date of Birth",
              icon: Icons.calendar_today,
              errorMessage: "Please enter Date of Birth",
              readOnly: true,
              onTap: datePicker),
          Padding(
            padding:
                const EdgeInsets.only(top: 9, bottom: 0, left: 27.0, right: 0),
            child: Text(
              "Gender",
              style:
                  TextStyle(color: Theme.of(context).hintColor, fontSize: 16),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadioButton(
                title: "Male",
                value: 2,
                groupValue: groupValue,
                onChanged: (newValue) => setState(() => groupValue = newValue!),
              ),
              CustomRadioButton(
                title: "Female",
                value: 1,
                groupValue: groupValue,
                onChanged: (newValue) => setState(() => groupValue = newValue!),
              ),
              CustomRadioButton(
                title: "Other",
                value: 0,
                groupValue: groupValue,
                onChanged: (newValue) => setState(() => groupValue = newValue!),
              ),
            ],
          ),
          Center(
            child: CustomAnimatedButton(
              text: 'Register',
              textColor: Theme.of(context).canvasColor,
              color: Theme.of(context).primaryColor,
              func: _register,
            ),
          ),
        ]),
      ),
    );
  }
}
