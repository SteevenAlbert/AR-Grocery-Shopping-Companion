import 'package:ar_grocery_companion/constants/constants.dart';
import 'package:ar_grocery_companion/data/helpers/db_helper.dart';
import 'package:ar_grocery_companion/data/providers/theme_mode_provider.dart';
import 'package:ar_grocery_companion/services/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'router.dart';
import 'utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //Background
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //Foreground
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print("Got a message whilst in the foreground");
    print("Message data ${message.data}");
    if (message.notification != null) {
      print("Message also contained a notification: ${message.notification}");
    }
  });

  initConnectionStatus();

  FirebaseHelper db = FirebaseHelper();
  db.init();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(
    ProviderScope(child: const MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(themeModeProvider);
    return MaterialApp.router(
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
