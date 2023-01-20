import 'package:augmented_reality_plugin_wikitude/wikitude_plugin.dart';
import 'package:augmented_reality_plugin_wikitude/wikitude_response.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:ar_grocery_companion/constants/constants.dart';
import 'package:ar_grocery_companion/domain/sample.dart';
import 'package:ar_grocery_companion/presentation/components/custom_widgets/custom_animated_button.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late AnimationController _dotsController;

  @override
  void initState() {
    super.initState();
    _dotsController = AnimationController(vsync: this);

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _dotsController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Lottie.asset(
              'assets/images/dot-pattern.json',
              controller: _dotsController,
              onLoaded: (composition) {
                _dotsController
                  ..duration = composition.duration
                  ..repeat(reverse: false);
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  "AR and Product Recognition \nfunctionality disabled in production due to licensing limitations",
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center),
              CustomAnimatedButton(
                text: "Start Scanning",
                color: Theme.of(context).primaryColor,
                textColor: Theme.of(context).canvasColor,
                //create a snackbar with scaffold messenger
                func: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Functionality Disabled")));
                },
              ),
            ],
          ),
        ],
      )),
    );
  }
}
