import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/models/product/product_category.dart';
import 'package:ar_grocery_companion/screens/home/components/featured_products.dart';

class Cat_Tabs extends StatefulWidget {
  final Size size;
  Cat_Tabs({required this.size});
  @override
  _Cat_TabsState createState() => _Cat_TabsState();
}

class _Cat_TabsState extends State<Cat_Tabs>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    ProductCategory allvar = ProductCategory(name: "All");
    ProductCategory.all.insert(0, allvar);
    _tabController =
        new TabController(length: ProductCategory.all.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TabBar(
            isScrollable: true,
            unselectedLabelColor: Theme.of(context).disabledColor,
            labelColor: Theme.of(context).primaryColor,
            tabs: List.generate(
              ProductCategory.all.length,
              (index) => Tab(text: ProductCategory.all[index].name),
            ),
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),

          // FeaturedProducts(size: widget.size)
        ],
      ),
    );
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }
}
// List.generate(Product.all.length, (index) {
//           return Center(
//             child: ProductCard(size: widget.size, product: Product.all[index]),
//           );
//         })