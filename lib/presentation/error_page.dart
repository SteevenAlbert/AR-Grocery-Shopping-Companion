import 'package:flutter/material.dart';
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
      body: Container(
        child: Column(
          children: [
            AnimatedContainer(
              margin: EdgeInsets.all(0.0),
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width / 1,
              duration: const Duration(seconds: 1),
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
            Center(
              child: Text(
                "Something Went Wrong",
                style: TextStyle(fontSize: 30, fontFamily: "Poppins"),
              ),
            ),
            CustomAnimatedButton(
                textColor: Theme.of(context).canvasColor,
                color: Theme.of(context).primaryColor,
                text: "Restart App".toUpperCase(),
                func: () async {
                  Restart.restartApp();
                })
          ],
        ),
      ),
    );
  }
}
