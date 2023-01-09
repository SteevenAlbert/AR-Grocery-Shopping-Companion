import 'package:ar_grocery_companion/data/providers/theme_mode_provider.dart';
import 'package:flutter/material.dart';
import 'router.dart';
import 'utils.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(
    ProviderScope(child: const MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode =
        ref.watch(themeModeProvider) ? ThemeMode.dark : ThemeMode.light;
    return MaterialApp.router(
      routerConfig: MyRouter.router,
      debugShowCheckedModeBanner: false,
      themeMode: darkMode,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: createMaterialColor(Color(0xFF549E83)),
      ),
    );
  }
}