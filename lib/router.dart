import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:ar_grocery_companion/presentation/admin/add_admin_page.dart';
import 'package:ar_grocery_companion/presentation/admin/categories/crud/add_category_page.dart';
import 'package:ar_grocery_companion/presentation/admin/categories/crud/edit_category_page.dart';
import 'package:ar_grocery_companion/presentation/admin/companies/crud/edit_company_page.dart';
import 'package:ar_grocery_companion/presentation/admin/products/crud/add_product_page.dart';
import 'package:ar_grocery_companion/presentation/admin/products/crud/edit_product_page.dart';
import 'package:catcher/catcher.dart';
import 'package:go_router/go_router.dart';

import 'package:ar_grocery_companion/domain/models/company.dart';
import 'package:ar_grocery_companion/presentation/admin/companies/crud/add_company_page.dart';
import 'package:ar_grocery_companion/presentation/admin/home/admin_home_page.dart';
import 'package:ar_grocery_companion/presentation/authentication/authentication.dart';
import 'package:ar_grocery_companion/presentation/companies/companies_list_page.dart';
import 'package:ar_grocery_companion/presentation/companies/company_details.dart';
import 'package:ar_grocery_companion/presentation/error_page.dart';
import 'package:ar_grocery_companion/presentation/main_page.dart';
import 'package:ar_grocery_companion/presentation/no_internet_page.dart';
import 'package:ar_grocery_companion/presentation/product_info/product_page.dart';
import 'package:ar_grocery_companion/presentation/profile/profile_page.dart';
import 'package:ar_grocery_companion/presentation/scan/arview.dart';
import 'package:ar_grocery_companion/presentation/search/search_page.dart';
import 'package:ar_grocery_companion/presentation/settings/settings_page.dart';
import 'package:ar_grocery_companion/presentation/splash_screen.dart';

import 'domain/models/product/product.dart';

class MyRouter {
  MyRouter();
  static late final router = GoRouter(
    navigatorKey: Catcher.navigatorKey,
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
          path: '/product_page/:fromAR',
          builder: (context, state) => ProductPage(
                product: state.extra as Product,
                fromAR: state.params['fromAR'],
              )),
      GoRoute(
          path: '/profile_page',
          builder: (context, state) => const ProfilePage()),
      GoRoute(
          path: '/add_admin',
          builder: (context, state) => const AddAdminPage()),
      GoRoute(
          path: '/search_page',
          builder: (context, state) => const SearchPage()),
      GoRoute(
          path: '/settings_page',
          builder: (context, state) => const SettingsPage()),

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
          builder: (context, state) => ARView()),

      GoRoute(
          name: 'noInternet',
          path: '/noInternet',
          builder: (context, state) => noInternetScreen()),

      // Admin Module Pages
      GoRoute(
          path: '/add_company_page',
          builder: (context, state) => const AddCompanyPage()),
      GoRoute(
          path: '/edit_company_page',
          builder: (context, state) => EditCompanyPage(
                company: state.extra as Company,
              )),
      GoRoute(
          path: '/add_category_page',
          builder: (context, state) => AddCategoryPage()),
      GoRoute(
          path: '/edit_category_page',
          builder: (context, state) => EditCategoryPage(
                customCategory: state.extra as CustomCategory,
              )),
      GoRoute(
          path: '/add_product_page',
          builder: (context, state) => AddProductPage()),
      GoRoute(
          path: '/edit_product_page',
          builder: (context, state) => EditProductPage(
                product: state.extra as Product,
              )),
    ],
    errorBuilder: (context, state) => SomethingWentWrongScreen(),
  );
}
