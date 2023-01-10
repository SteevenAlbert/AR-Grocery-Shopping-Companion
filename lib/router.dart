import 'package:ar_grocery_companion/models/sample.dart';
import 'package:ar_grocery_companion/screens/settings/settings_page.dart';
import 'package:ar_grocery_companion/splash_screen.dart';
import 'package:ar_grocery_companion/screens/error_page.dart';
import 'package:ar_grocery_companion/screens/authentication/authentication.dart';
import 'package:ar_grocery_companion/screens/admin/products/edit_product_page.dart';
import 'package:ar_grocery_companion/screens/admin/home/admin_home_page.dart';
import 'package:ar_grocery_companion/screens/admin/products/add_product_page.dart';
import 'package:ar_grocery_companion/screens/admin/products/products_dashboard.dart';
import 'package:ar_grocery_companion/screens/main_page.dart';
import 'package:ar_grocery_companion/screens/product_info/product_page.dart';
import 'package:ar_grocery_companion/screens/scan/arview.dart';
import 'package:ar_grocery_companion/screens/profile/profile_page.dart';
import 'package:ar_grocery_companion/screens/scan/scan_intro_page.dart';
import 'package:ar_grocery_companion/screens/search/search_page.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:go_router/go_router.dart';

import 'models/product.dart';

class MyRouter {
  MyRouter();
  static late final router = GoRouter(
    debugLogDiagnostics: true, //set to false in Production
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      //Add Routes Here
      GoRoute(
          path: '/authenticate',
          builder: (context, state) => const AuthenticationPage()),
      GoRoute(
          path: '/customer_homepage',
          builder: (context, state) => const MainPage()),
      GoRoute(
          path: '/admin_homepage',
          builder: (context, state) => const AdminHomePage()),
      GoRoute(
          name: 'ProductPage',
          path: '/product_page',
          builder: (context, state) =>
              ProductPage(product: state.extra as Product)),

      GoRoute(
          path: '/profile_page',
          builder: (context, state) => const ProfilePage()),
      GoRoute(
          path: '/search_page',
          builder: (context, state) => const SearchPage()),
      GoRoute(
          path: '/settings_page',
          builder: (context, state) => const SettingsPage()),

      GoRoute(
          path: '/products_dashboard',
          builder: (context, state) => const ProductsDashboard()),
      GoRoute(
          path: '/add_product_page',
          builder: (context, state) => const AddProductPage()),
      GoRoute(
          path: '/scan_intro_page',
          builder: (context, state) => const ScanPage()),
      GoRoute(
          name: 'EditProductPage',
          path: '/edit_product_page',
          builder: (context, state) =>
              EditProductPage(product: state.extra as Product)),
      GoRoute(
          name: 'ARView',
          path: '/arview',
          builder: (context, state) => ARView(sample: state.extra as Sample)),
    ],
    errorBuilder: (context, state) => SomethingWentWrongScreen(),
  );
}
