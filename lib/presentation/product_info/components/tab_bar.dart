import 'package:flutter/material.dart';
import '../../../domain/models/product/product.dart';

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
        labelColor: Theme.of(context).canvasColor,
        labelStyle: Theme.of(context).textTheme.labelLarge,
        unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
        unselectedLabelStyle: Theme.of(context).textTheme.labelMedium,
        labelPadding: EdgeInsets.symmetric(horizontal: 30.0),
        indicator: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(50),),
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
