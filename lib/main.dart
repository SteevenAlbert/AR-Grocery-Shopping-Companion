import 'package:ar_grocery_companion/constants/constants.dart';
import 'package:ar_grocery_companion/data/providers/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'router.dart';
import 'utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
