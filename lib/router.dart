import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/domain/sample.dart';
import 'package:ar_grocery_companion/presentation/companies/companies_list_page.dart';
import 'package:ar_grocery_companion/presentation/companies/company_details.dart';
import 'package:ar_grocery_companion/presentation/settings/settings_page.dart';
import 'package:ar_grocery_companion/presentation/splash_screen.dart';
import 'package:ar_grocery_companion/presentation/error_page.dart';
import 'package:ar_grocery_companion/presentation/admin/products/edit_product_page.dart';
import 'package:ar_grocery_companion/presentation/admin/home/admin_home_page.dart';
import 'package:ar_grocery_companion/presentation/admin/products/add_product_page.dart';
import 'package:ar_grocery_companion/presentation/admin/products/products_dashboard.dart';
import 'package:ar_grocery_companion/presentation/authentication/authentication.dart';
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
      //Add Routes Here
      GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
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
      // GoRoute(
      //     path: '/scan_intro_page',
      //     builder: (context, state) => const ScanPage()),
      GoRoute(
          name: 'EditProductPage',
          path: '/edit_product_page',
          builder: (context, state) =>
              EditProductPage(product: state.extra as Product)),

      GoRoute(
          path: '/companies_list_page',
          builder: (context, state) => const CompaniesListPage()),
      GoRoute(
          path: '/company_details',
          builder: (context, state) =>
              CompanyDetails(company: state.extra as Company)),

      GoRoute(
          name: 'ARView',
          path: '/arview',
          builder: (context, state) => ARView(sample: state.extra as Sample)),

      GoRoute(
          name: 'noInternet',
          path: '/noInternet',
          builder: (context, state) => SomethingWentWrongScreen()),
    ],
    errorBuilder: (context, state) => SomethingWentWrongScreen(),
  );
}
