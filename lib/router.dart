import 'package:ar_grocery_companion/domain/sample.dart';
import 'package:ar_grocery_companion/presentation/settings/settings_page.dart';
import 'package:ar_grocery_companion/presentation/splash_screen.dart';
import 'package:ar_grocery_companion/presentation/error_page.dart';
import 'package:ar_grocery_companion/presentation/admin/products/edit_product_page.dart';
import 'package:ar_grocery_companion/presentation/admin/home/admin_home_page.dart';
import 'package:ar_grocery_companion/presentation/admin/products/add_product_page.dart';
import 'package:ar_grocery_companion/presentation/admin/products/products_dashboard.dart';
import 'package:ar_grocery_companion/presentation/main_page.dart';
import 'package:ar_grocery_companion/presentation/product_info/product_page.dart';
import 'package:ar_grocery_companion/presentation/scan/arview.dart';
import 'package:ar_grocery_companion/presentation/profile/profile_page.dart';
import 'package:ar_grocery_companion/presentation/scan/scan_intro_page.dart';
import 'package:ar_grocery_companion/presentation/search/search_page.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'domain/models/product/product.dart';

class MyRouter {
  MyRouter();
  static late final router = GoRouter(
    debugLogDiagnostics: true, //set to false in Production
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
      //Add Routes Here
      GoRoute(
          path: '/authenticate', builder: (context, state) => const MainPage()),
      //else if session loggedIn as admin
      // GoRoute(
      //   path: '/authenticate',
      //   builder: (context, state) => const AdminHomePage()),
      //else if session not loggedIn
      // GoRoute(
      //     path: '/authenticate',
      //     builder: (context, state) => const AuthenticationPage()),
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
