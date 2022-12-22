import 'package:flutter/material.dart';
import 'router.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MyRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: const MaterialColor(0xFF549E83, const {
          50: Color.fromARGB(85, 27, 210, 173),
          100: Color.fromARGB(105, 27, 210, 173),
          200: Color.fromARGB(125, 27, 210, 173),
          300: Color.fromARGB(135, 27, 210, 173),
          400: Color.fromARGB(155, 27, 210, 173),
          500: Color.fromARGB(175, 27, 210, 173),
          600: Color.fromARGB(195, 27, 210, 173),
          700: Color.fromARGB(215, 27, 210, 173),
          800: Color.fromARGB(235, 27, 210, 173),
          900: Color.fromARGB(255, 27, 210, 173)
        }),
      ),
    );
  }
}
