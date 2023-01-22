import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/presentation/components/products_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';

class CatTabs extends ConsumerStatefulWidget {
  final Size size;
  final List<CustomCategory> categories;
  final List<Product> products;
  CatTabs(
      {required this.size, required this.categories, required this.products});
  @override
  _Cat_TabsState createState() => _Cat_TabsState();
}

class _Cat_TabsState extends ConsumerState<CatTabs>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController =
        new TabController(length: widget.categories.length + 1, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> categoriesTitles = [Tab(text: "All")];
    categoriesTitles.addAll(List.generate(
            widget.categories.length,
            (index) => Tab(text: widget.categories[index].name),
          ));
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TabBar(
          isScrollable: true,
          unselectedLabelColor: Theme.of(context).disabledColor,
          labelColor: Theme.of(context).primaryColor,
          tabs: categoriesTitles,
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            width: widget.size.width,
            height: widget.size.height * 1.3,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                ProductsGrid(
                  products: widget.products,
                ),
                for (var i = 0; i < widget.categories.length; i++)
                  ProductsGrid(
                  products: widget.products.where((element) => element.customCategory.id == widget.categories[i].id).toList(),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }
}
