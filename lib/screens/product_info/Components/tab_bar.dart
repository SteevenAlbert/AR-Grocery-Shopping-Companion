import 'package:ar_grocery_companion/screens/product_info/components/alternative_products_tab.dart';
import 'package:flutter/material.dart';
import '../../../models/product.dart';
import '../../home/components/featured_products.dart';
import 'nutritional_facts_tab.dart';
import 'online_stores_tab.dart';

class ProductTabBar extends StatefulWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  const ProductTabBar({super.key, required this.product});
  final Product product;
  @override
  ProductTabBarState createState() => ProductTabBarState();
}

class ProductTabBarState extends State<ProductTabBar> {
  //const ProductTabBar({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
      child: TabBar(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        splashBorderRadius: BorderRadius.circular(50),
        isScrollable: true,
        labelColor: Colors.white,
        labelStyle: TextStyle(
            fontFamily: "Poppins",
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20),
        unselectedLabelColor: Color.fromARGB(125, 0, 0, 0),
        unselectedLabelStyle: TextStyle(
            fontFamily: "Poppins", fontWeight: FontWeight.bold, fontSize: 16),
        labelPadding: EdgeInsets.symmetric(horizontal: 30.0),
        indicator: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 85, 182, 153),
              Color.fromARGB(255, 93, 201, 169),
            ]),
            borderRadius: BorderRadius.circular(50),
            color: Colors.redAccent),
        tabs: [
          Tab(
            child: Text('Online Stores'),
          ),
          Tab(
            child: Text('Nutritional Facts'),
          ),
          Tab(
            child: Text('Alternative Products'),
          ),
        ],
      ),
    );
    // Expanded(
    //   child: TabBarView(children: [
    //     OnlineStores(product: widget.product),
    //     NutritionalFacts(product: widget.product),
    //     alternativeProducts(size),
    //   ], controller: _tabController),
    // ),
  }
}
