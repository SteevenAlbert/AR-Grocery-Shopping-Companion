import 'package:ar_grocery_companion/constants/constants.dart';
import 'package:ar_grocery_companion/data/helpers/db_helper.dart';
import 'package:ar_grocery_companion/data/providers/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'router.dart';
import 'services/connection_checker.dart';
import 'utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();

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
