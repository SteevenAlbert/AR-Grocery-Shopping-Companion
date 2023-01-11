import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:like_button/like_button.dart';
import '../../models/product.dart';
import '../home/components/fav_icon.dart';
import 'components/alternative_products_tab.dart';
import 'components/nutritional_facts_tab.dart';
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
                                Text(
                                  product.servingSize,
                                  style: Theme.of(context).textTheme.bodySmall,
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
                  NutritionalFacts(product: product),
                  alternativeProducts(context),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

    /*Align(
        alignment: Alignment.topCenter,
        child: Container(
          alignment: Alignment.center,
          child: Stack(alignment: Alignment.topCenter, children: <Widget>[
            Transform.scale(
              scaleX: 2.8,
              scaleY: 1.8,
              child: SizedBox(
                height: 370,
                width: 500,
                child: blobSVG,
              ),
            ),
            Center(
                child: Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () => context.go('/customer_home'),
                              icon: Image.asset('assets/images/backbtn.png')),
                          LikeButton()
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomCenter,
                      height: MediaQuery.of(context).size.height / 2 -
                          MediaQuery.of(context).size.height / 6,
                      child: Image.asset(product.image),
                    ),
                    SizedBox(height: 20),
                    Text(
                      product.name,
                      style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(205, 32, 69, 83)),
                    ),
                    SizedBox(height: 15),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            "325 cal.",
                            style: TextStyle(
                                fontFamily: "Ubuntu",
                                fontSize: 16,
                                color: Color.fromARGB(125, 0, 0, 0)),
                          ),
                          // Text(
                          //   "130g",
                          //   style: TextStyle(
                          //       fontFamily: "Ubuntu",
                          //       fontSize: 16,
                          //       color: Color.fromARGB(125, 0, 0, 0)),
                          // ),
                        ]),
                    SizedBox(height: 15),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      RatingBar.builder(
                        itemSize: 20,
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Color.fromARGB(152, 255, 193, 7),
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Row(
                        children: [
                          Text(
                            "3.5",
                            style: TextStyle(
                                fontFamily: "Ubuntu",
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            "/5",
                            style: TextStyle(
                                fontFamily: "Ubuntu",
                                color: Color.fromARGB(126, 0, 0, 0),
                                fontSize: 16),
                          ),
                        ],
                      )
                    ]),
                    Expanded(child: ProductTabBar(product: product))
                  ]),
            )),
          ]),
        ),
      ),
    );*/
