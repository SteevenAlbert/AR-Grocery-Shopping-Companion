import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:restart_app/restart_app.dart';
import 'package:ar_grocery_companion/presentation/authentication/custom_widgets/custom_animated_button.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class noInternetScreen extends StatefulWidget {
  @override
  _noInternetScreenState createState() => _noInternetScreenState();
}

class _noInternetScreenState extends State<noInternetScreen>
    with TickerProviderStateMixin {
  late AnimationController _splashController;
  @override
  void initState() {
    super.initState();
    _splashController = AnimationController(vsync: this);
  }

  //dispose
  @override
  void dispose() {
    _splashController.dispose();
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
                  controller: _splashController,
                  onLoaded: (composition) {
                    _splashController
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
