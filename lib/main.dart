import 'package:catcher/catcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ar_grocery_companion/constants/constants.dart';
import 'package:ar_grocery_companion/data/helpers/db_helper.dart';
import 'package:ar_grocery_companion/data/providers/theme_mode_provider.dart';
import 'package:ar_grocery_companion/services/firebase_options.dart';

import 'router.dart';
import 'utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Firebase Initalization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseHelper.instance.init();

  //Push Notifications
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("Got a message whilst in the foreground");
    print("Message data ${message.data}");
    if (message.notification != null) {
      print("Message also contained a notification: ${message.notification}");
    }
  });

  //Check Connection Status
  initConnectionStatus();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  //Catcher(rootWidget: ProviderScope(child: MyApp()), debugConfig: debugOptions);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(themeModeProvider);

    //Override Flutter's red screen of death
    // ErrorWidget.builder =
    //     (FlutterErrorDetails details) => SomethingWentWrongScreen();
    return MaterialApp.router(
      navigatorKey: Catcher.navigatorKey,
      routerConfig: MyRouter.router,
      debugShowCheckedModeBanner: false,
      themeMode: darkMode,
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: kAppPrimaryColor,
        colorScheme: ColorScheme.fromSwatch(
            primarySwatch: createMaterialColor(kAppPrimaryColor)),
      ),
      theme: ThemeData(
        primarySwatch: createMaterialColor(kAppPrimaryColor),
      ),
    );
  }
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
