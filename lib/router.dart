import 'package:ar_grocery_companion/screens/main_page.dart';
import 'package:ar_grocery_companion/screens/product_info/product_page.dart';
import 'package:go_router/go_router.dart';

class MyRouter {
  MyRouter();
  static late final router = GoRouter(
    debugLogDiagnostics: true, //set to false in Production
    routes: [
      //Add Routes Here
      GoRoute(path: '/', builder: (context, state) => const MainPage()),
      GoRoute(
          path: '/product_page',
          builder: (context, state) => const ProductPage())
    ],
  );
}
