import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/models/product.dart';
import 'package:ar_grocery_companion/screens/home/components/stars.dart';
import 'package:ar_grocery_companion/screens/home/components/fav_icon.dart';
import 'package:simple_shadow/simple_shadow.dart';

import 'package:go_router/go_router.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Function? press;
  final int sectionID;
  const ProductCard({
    Key? key,
    required this.product,
    required this.sectionID,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => GoRouter.of(context).push("/product_page", extra: product),
        child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.black12,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFe5e5e5).withOpacity(0.4),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 50,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.05),
                            )
                          ]),
                      child: SimpleShadow(
                          child: (sectionID == 1)
                              ? AspectRatio(
                                  aspectRatio: 16 / 10,
                                  child: Image.asset(
                                    product.image,
                                  ))
                              : Image.asset(product.image,
                                  width: 100, height: 100)),
                    ),
                  ),
                  SizedBox(height: 3),
                  Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: IconTheme(
                                        data: IconThemeData(
                                          color: Colors.amber,
                                          size: 11,
                                        ),
                                        child: StarDisplay(value: 3))),
                                SizedBox(height: 3),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    product.name,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13),
                                  ),
                                ),
                                SizedBox(height: 3),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(product.servingSize,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: Colors.grey)),
                                ),
                              ]),
                        ),
                        
                      ])),
                ],
              ),
            )));
  }
}
