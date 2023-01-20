import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:restart_app/restart_app.dart';

import 'components/custom_widgets/custom_animated_button.dart';

class SomethingWentWrongScreen extends StatefulWidget {
  @override
  SomethingWentWrongScreenState createState() =>
      SomethingWentWrongScreenState();
}

class SomethingWentWrongScreenState extends State<SomethingWentWrongScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this);
  }

  //dispose
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Lottie.asset(
                  'assets/images/shoppingcart.json',
                  controller: animationController,
                  onLoaded: (composition) {
                    animationController
                      ..duration = composition.duration
                      ..repeat(reverse: false);
                  },
                ),
              ),
            ],
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.20,
              left: MediaQuery.of(context).size.width * 0.25,
              right: MediaQuery.of(context).size.width * 0.25,
              child: Center(
                child: Text(
                  "Something Went Wrong",
                  style: TextStyle(fontSize: 45, fontFamily: "Poppins"),
                ),
              )),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.08,
              left: MediaQuery.of(context).size.width * 0.20,
              right: MediaQuery.of(context).size.width * 0.20,
              child: CustomAnimatedButton(
                  textColor: Theme.of(context).canvasColor,
                  color: Theme.of(context).primaryColor,
                  text: "Restart App".toUpperCase(),
                  func: () async {
                    Restart.restartApp();
                  }))
        ],
      ),
    );
  }
}
