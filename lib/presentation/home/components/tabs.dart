import 'package:ar_grocery_companion/data/repositories/categories_repository.dart';
import 'package:ar_grocery_companion/presentation/home/components/featured_products.dart';
import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';

class Cat_Tabs extends StatefulWidget {
  final Size size;
  Cat_Tabs({required this.size});
  @override
  _Cat_TabsState createState() => _Cat_TabsState();
}

class _Cat_TabsState extends State<Cat_Tabs>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<CustomCategory>? allcats;
  @override
  void initState() {
    allcats = CategoriesRepository.instance.getCategories();
    allcats!.insert(0, CustomCategory(id: "0",name: "All"));
    _tabController = new TabController(length: allcats!.length, vsync: this);
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
              allcats!.length,
              (index) => Tab(text: allcats![index].name),
            ),
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Expanded(
                child: Container(
                  width: widget.size.width,
                  height: widget.size.height * 1.3,
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      for (var i = 0; i < allcats!.length; i++)
                        FeaturedProducts(
                          size: widget.size,
                          cat_id: allcats?[i].id??"-1",
                        )
                    ],
                  ),
                ),
              )),
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