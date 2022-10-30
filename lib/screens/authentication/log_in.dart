import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ar_grocery_companion/components/authentication/background2.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:animated_button/animated_button.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(children: [
        Background2(),
        Container(
          margin: EdgeInsets.only(left: 50, top: 250, right: 0, bottom: 0),
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(1),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
                bottomRight: Radius.circular(0)),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.7),
                spreadRadius: 25,
                blurRadius: 0,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: Stack(alignment: Alignment.center, children: [
            Container(
              margin: EdgeInsets.only(left: 35, top: 35, right: 35, bottom: 0),
              height: double.infinity,
              width: double.infinity,
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Username or Email",
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
                      focusedBorder: InputBorder.none,
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(width: 2, color: Colors.red.shade200),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                  child: PasswordField(
                    // color: Theme.of(context).primaryColor,
                    passwordConstraint: r'.*[%@$#.*].*',
                    inputDecoration: PasswordDecoration(
                        hintStyle: TextStyle(
                      color: Theme.of(context).hintColor.withOpacity(0.5),
                    )),
                    hintText: 'Password',
                    border: PasswordBorder(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      // focusedBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(
                      //     color: Colors.blue.shade100,
                      //   ),
                      //   borderRadius: BorderRadius.circular(12),
                      // ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(width: 2, color: Colors.red.shade200),
                      ),
                    ),
                    errorMessage: 'Password must contain special characters.',
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: AnimatedButton(
                        width: 269,
                        height: 59,
                        color: Theme.of(context).primaryColor,
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onPressed: () => context.go('/customer_home')),
                  ),
                ),
              ]),
            ),
          ]),
        )
      ]),
      // ),
    );
  }
}
