import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _splashController;

  @override
  void initState() {
    super.initState();
    _splashController = AnimationController(vsync: this);
    _splashController.addListener(() {
      if (_splashController.value > 0.7) {
        _splashController.stop();
        Future.delayed(const Duration(seconds: 1)).then((value) async {
          (await SessionManager().containsKey("isLoggedIn") != true ||
                  await SessionManager().get("isLoggedIn") != true)
              ? context.go('/authenticate')
              : ((await SessionManager().get("type") == 'customer')
                  ? context.go('/customer_homepage')
                  : context.go('/admin_homepage'));
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _splashController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(seconds: 1),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
            ),
            child: Lottie.asset(
              'assets/splash/splash1.json',
              controller: _splashController,
              onLoaded: (composition) {
                _splashController
                  ..duration = composition.duration
                  ..forward();
              },
            ),
          ),
        ],
      ),
    );
  }
}
