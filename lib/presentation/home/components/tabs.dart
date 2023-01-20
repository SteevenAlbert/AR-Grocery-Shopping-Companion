import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:ar_grocery_companion/presentation/home/components/featured_products.dart';

class CatTabs extends ConsumerStatefulWidget {
  final Size size;
  final List<CustomCategory> categories;
  CatTabs({required this.size, required this.categories});
  @override
  _Cat_TabsState createState() => _Cat_TabsState();
}

class _Cat_TabsState extends ConsumerState<CatTabs>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController =
        new TabController(length: widget.categories.length, vsync: this);
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
            widget.categories.length,
            (index) => Tab(text: widget.categories[index].name),
          ),
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
                for (var i = 0; i < widget.categories.length; i++)
                  FeaturedProducts(
                    size: widget.size,
                    cat_id: widget.categories[i].id,
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
