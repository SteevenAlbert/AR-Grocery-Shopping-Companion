import 'package:ar_grocery_companion/screens/authentication/log_in.dart';
import 'package:ar_grocery_companion/screens/main_page.dart';
import 'package:ar_grocery_companion/screens/product_info/product_page.dart';
import 'package:go_router/go_router.dart';

import 'models/product.dart';

class MyRouter {
  MyRouter();
  static late final router = GoRouter(
    debugLogDiagnostics: true, //set to false in Production
    routes: [
      //Add Routes Here
      GoRoute(path: '/', builder: (context, state) => const LogInPage()),
      GoRoute(path: '/home', builder: (context, state) => const MainPage()),
      GoRoute(
          name: 'ProductPage',
          path: '/product_page',
          builder: (context, state) =>
              ProductPage(product: state.extra as Product))
    ],
  );
}
