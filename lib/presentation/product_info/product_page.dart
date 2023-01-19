import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:ar_grocery_companion/presentation/product_info/components/product_details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../home/components/fav_icon.dart';
import 'components/alternative_products_tab.dart';
import 'components/online_stores_tab.dart';
import 'components/product_image_carousel.dart';
import 'components/tab_bar.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  const ProductPage({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Tab 1', 'Tab 2', 'Tab 3'];
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverPadding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    sliver: SliverAppBar(
                        backgroundColor: Theme.of(context).canvasColor,
                        stretch: true,
                        pinned: true,
                        elevation: 0,
                        automaticallyImplyLeading: false,
                        stretchTriggerOffset: 100,
                        expandedHeight: 600.0,
                        collapsedHeight: 100,
                        leading: IconButton(
                            onPressed: () => context.pop(),
                            icon: Image.asset('assets/images/backbtn.png')),
                        actions: [FavIcon(product: product)],
                        flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          collapseMode: CollapseMode.parallax,
                          expandedTitleScale: 2,
                          titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 80),
                          title: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      product.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge,
                                      textScaleFactor: 0.7,
                                    ),
                                  ],
                                ),
                              ]),
                          background: Container(
                            child: ProductCarouselSlider(product),
                          ),
                          stretchModes: [
                            StretchMode.zoomBackground,
                            StretchMode.blurBackground
                          ],
                        ),
                        bottom: ProductTabBar(product: product)),
                  ))
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: TabBarView(children: [
                  OnlineStores(product: product),
                  ProductDetails(product: product),
                  AlternativeProducts(product: product),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
