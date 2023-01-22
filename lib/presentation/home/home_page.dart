import 'package:ar_grocery_companion/data/repositories/categories_repository.dart';
import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/presentation/home/components/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:ar_grocery_companion/presentation/components/header.dart';
import 'package:ar_grocery_companion/presentation/home/components/carousel.dart';
import 'package:ar_grocery_companion/presentation/search/search_bar.dart';
import 'package:ar_grocery_companion/data/repositories/users_repository.dart';

AppUsersRepository usersRepo = AppUsersRepository.instance;
Future<String> getSessionID() async {
  return (await SessionManager().containsKey("isLoggedIn") != true ||
          await SessionManager().get("isLoggedIn") != true)
      ? ""
      : await SessionManager().get("UID");
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Product>> products;
  late Future<List<CustomCategory>> categories;

  @override
  void initState() {
    super.initState();
    products = ProductsRepository.instance.fetchProductsList();
    categories = CategoriesRepository.instance.fetchCategoriesList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(children: [
      Header(size: size),
      Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SearchBar(size: size),
            CarouselSliderExample(),
            FutureBuilder(
                future: Future.wait([categories, products]),
                builder: ((context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return CatTabs(
                      size: size,
                      categories: snapshot.data[0],
                      products: snapshot.data[1],
                    );
                  }
                  return Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator());
                })),
            SizedBox(height: 12),
          ],
        ),
      ),
    ]));
  }
}

Future<List<String>?> retireveFavs() async {
  String UID = await getSessionID();
  return usersRepo.fetchFavsList(UID);
}
