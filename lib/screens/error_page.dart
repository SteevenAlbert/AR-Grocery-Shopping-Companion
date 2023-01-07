import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'authentication/custom_widgets.dart';

class SomethingWentWrongScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            "assets/images/3_Something_Went_Wrong.png",
            fit: BoxFit.cover,
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.10,
              left: MediaQuery.of(context).size.width * 0.25,
              right: MediaQuery.of(context).size.width * 0.25,
              child: customAnimatedButton(
                  context: context,
                  text: "Go To Homepage".toUpperCase(),
                  func: () {
                    context.go('/');
                  }))
        ],
      ),
    );
  }
}
