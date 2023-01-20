import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:restart_app/restart_app.dart';
import 'package:ar_grocery_companion/presentation/components/custom_widgets/custom_animated_button.dart';

class noInternetScreen extends StatefulWidget {
  @override
  _noInternetScreenState createState() => _noInternetScreenState();
}

class _noInternetScreenState extends State<noInternetScreen>
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
                  'assets/images/disconnected.json',
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
                  "Internet Connection Lost",
                  style: TextStyle(fontSize: 45, fontFamily: "Poppins"),
                ),
              )),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.10,
              left: MediaQuery.of(context).size.width * 0.25,
              right: MediaQuery.of(context).size.width * 0.25,
              child: CustomAnimatedButton(
                  textColor: Theme.of(context).canvasColor,
                  color: Theme.of(context).primaryColor,
                  text: "Try Again".toUpperCase(),
                  func: () async {
                    Restart.restartApp();
                  }))
        ],
      ),
    );
  }
}
