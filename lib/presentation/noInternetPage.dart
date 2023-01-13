import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restart_app/restart_app.dart';
import 'authentication/custom_widgets.dart';
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
                // "assets/images/3_Something_Went_Wrong.png",
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
              child: customAnimatedButton(
                  context: context,
                  text: "Try Again".toUpperCase(),
                  func: () async {
                    Restart.restartApp();
                  }))
        ],
      ),
    );
  }
}