import 'package:ar_grocery_companion/constants/constants.dart';
import 'package:ar_grocery_companion/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_shadow/simple_shadow.dart';

import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  List<Product> queriedProducts = [];

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'search',
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        onChanged: searchProducts,
                        controller: controller,
                        autofocus: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide.none),
                          suffixIcon: IntrinsicHeight(
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                InkWell(
                                    onTap: () => GoRouter.of(context)
                                        .push('/scan_intro_page'),
                                    child: Icon(Icons.qr_code_scanner)),
                                SizedBox(width: 9),
                                Container(
                                    height: 60,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(13),
                                        color: Theme.of(context).primaryColor),
                                    child: Icon(
                                        color: Colors.white, Icons.search)),
                              ])),
                          labelText: "Search Products",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                        onPressed: GoRouter.of(context).pop,
                        child: Text("Cancel", style: TextStyle(fontSize: 16)))
                  ],
                ),
              ),
              Expanded(
                  child: ListView.builder(
                itemCount: queriedProducts.length,
                itemBuilder: ((context, index) {
                  final product = queriedProducts[index];
                  return ListTile(
                      // title: Text(product.name),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: 65,
                              height: 65,
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              alignment: Alignment.center,
                              child: SimpleShadow(
                                child: FutureBuilder(
                                  future: FireStorage.getUrl(
                                      "/images/products_pictures/${product.images[0]}"),
                                  builder: ((context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Image.network(snapshot.data!);
                                    } else {
                                      return Image.asset(kNoProductImg);
                                    }
                                  }),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xFFe5e5e5).withOpacity(0.5),
                              )),
                          SizedBox(width: 16),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(product.name,
                                    style: TextStyle(fontSize: 14)),
                                Container(
                                  width: 85,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(product.manufacturer.name,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      onTap: () => GoRouter.of(context).pushNamed("ProductPage",
                          extra: product, params: {'fromAR': "false"}));
                }),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void searchProducts(String query) async {
    queriedProducts.clear();
    final input = query.toLowerCase();
    Future<List<Product>> products =
        ProductsRepository.instance.fetchProductsList();
    for (var product in await products) {
      if (product.name.toLowerCase().contains(input)) {
        setState(() => queriedProducts.add(product));
      }
    }
    if (query == "") {
      setState(() => queriedProducts.clear());
    }
  }
}
