import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'components/custom_widgets/custom_animated_button.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class SomethingWentWrongScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            // "assets/images/3_Something_Went_Wrong.png",
            "assets/images/7_Error.png",
            fit: BoxFit.cover,
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.10,
              left: MediaQuery.of(context).size.width * 0.215,
              right: MediaQuery.of(context).size.width * 0.215,
              child: CustomAnimatedButton(
                  text: "Go To Homepage".toUpperCase(),
                  textColor: Theme.of(context).canvasColor,
                  color: Theme.of(context).primaryColor,
                  func: () async {
                    (await SessionManager().containsKey("isLoggedIn") != true ||
                            await SessionManager().get("isLoggedIn") != true)
                        ? context.go('/authenticate')
                        : ((await SessionManager().get("type") == 'customer')
                            ? context.go('/customer_homepage')
                            : context.go('/admin_homepage'));
                  }))
        ],
      ),
    );
  }
}
