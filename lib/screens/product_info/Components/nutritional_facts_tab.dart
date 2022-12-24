import 'package:ar_grocery_companion/screens/product_info/Components/nutrition_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';

class NutritionalFacts extends StatelessWidget {
  final Product product;
  const NutritionalFacts({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return CustomScrollView(
          key: PageStorageKey<String>("NutritionalFacts"),
          slivers: <Widget>[
            SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
            SliverPadding(
                padding: const EdgeInsets.fromLTRB(15, 10.0, 15, 25.0),
                sliver: SliverToBoxAdapter(
                  child: Center(
                      child: Column(children: [
                    Text(
                      "Ingredients",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      product.ingredients.join(' - '),
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Allergy Information
                    Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Allergy Information",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              "Milk Chocolate (31.5%) (Sugar, Cocoa Butter, Cocoa Mass, Skimmed Milk Powder, Anhydrous, Milkfat, Emlsifiers Lecithins...",
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          nutrientWidget(
                              nutrientData: product.nutrients,
                              calories: product.calories,
                              servingSize: product.servingSize)
                        ],
                      ),
                    ),
                  ])),
                )),
          ],
        );
      },
    );
  }
}
