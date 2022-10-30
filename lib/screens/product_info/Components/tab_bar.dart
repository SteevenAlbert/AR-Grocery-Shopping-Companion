import 'package:flutter/material.dart';
import '../../../models/product.dart';
import 'nutritional_facts_tab.dart';

class ProductTabBar extends StatelessWidget {
  final Product product;
  const ProductTabBar({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 10,
            backgroundColor: Color.fromARGB(255, 250, 250, 250),
            elevation: 0,
            bottom: TabBar(
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
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
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
                    child: Text('Reviews'),
                  ),
                ]),
          ),
          body: TabBarView(children: [
            SingleChildScrollView(
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Text('Tab 1'),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                child: NutritionalFacts(product: product),
              ),
            ),
            Container(
              child: Center(
                child: Text('Tab 3'),
              ),
            ),
          ]),
        ));
  }
}
