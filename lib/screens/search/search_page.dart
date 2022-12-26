import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_shadow/simple_shadow.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final controller = TextEditingController();
  List<Product> products = Product.all;
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
                                  child: Image.asset(product.image)),
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
                                      Text(product.servingSize,
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
                      onTap: () => GoRouter.of(context)
                          .push("/product_page", extra: product));
                }),
              ))
            ],
          ),
        ),
      ),
    );
  }

  void searchProducts(String query) {
    queriedProducts.clear();
    final input = query.toLowerCase();
    for (var product in products) {
      if (product.name.toLowerCase().contains(input)) {
        setState(() => queriedProducts.add(product));
      }
    }
    if (query == "") {
      setState(() => queriedProducts.clear());
    }
  }
}
