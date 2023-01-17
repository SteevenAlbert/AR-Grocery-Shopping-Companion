import 'package:ar_grocery_companion/data/repositories/categories_repository.dart';
import 'package:ar_grocery_companion/presentation/home/components/featured_products.dart';
import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/domain/models/custom_category.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatTabs extends ConsumerStatefulWidget {
  final Size size;
  CatTabs({required this.size});
  @override
  _Cat_TabsState createState() => _Cat_TabsState();
}

class _Cat_TabsState extends ConsumerState<CatTabs>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    //Can't call cat length here for tabcontroller
    _tabController = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<List<CustomCategory>> categories =
        ref.watch(CategoriesRepository.instance.categoriesListFutureProvider);
    return Container(
      child: FutureBuilder(
          future: categories,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              List<CustomCategory> category = snapshot.data!;
              if (category[0].name != "All") {
                category.insert(0, CustomCategory(id: "0", name: "All"));
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TabBar(
                    isScrollable: true,
                    unselectedLabelColor: Theme.of(context).disabledColor,
                    labelColor: Theme.of(context).primaryColor,
                    tabs: List.generate(
                      category.length,
                      (index) => Tab(text: category[index].name),
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
                              for (var i = 0; i < category.length; i++)
                                FeaturedProducts(
                                  size: widget.size,
                                  cat_id: category[i].id,
                                )
                            ],
                          ),
                        ),
                      )),
                ],
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          })),
    );
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }
}
