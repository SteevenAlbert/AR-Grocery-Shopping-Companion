import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ar_grocery_companion/router.dart';
import 'package:restart_app/restart_app.dart';
import 'authentication/custom_widgets/custom_animated_button.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class noInternetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/nointernet.png",
              ),
              Text(
                "No Internet Connection Found.",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.10,
              left: MediaQuery.of(context).size.width * 0.25,
              right: MediaQuery.of(context).size.width * 0.25,
              child: CustomAnimatedButton(
                  text: "Try Again".toUpperCase(),
                  textColor: Theme.of(context).canvasColor,
                  color: Theme.of(context).primaryColor,
                  func: () async {
                    Restart.restartApp();
                  }))
        ],
      ),
    );
  }
}
