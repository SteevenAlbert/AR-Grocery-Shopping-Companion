import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/models/product.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:favorite_button/favorite_button.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Function? press;
  const ProductCard({
    Key? key,
    required this.size,
    required this.product,
    this.press,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () =>
              GoRouter.of(context).push("/product_page", extra: product),
          child: Container(
              width: size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Colors.blue,
              ),
              child: Center(
                child: Column(children: <Widget>[
                  Center(
                    child: Container(
                      height: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFe5e5e5),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 3),
                              blurRadius: 50,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.15),
                            )
                          ]),
                      child: SimpleShadow(
                        child: Center(child: Image.asset(product.image)),
                        offset: Offset(0, 6),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(product.name,
                                        style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  // Icon(Icons.favorite_border_outlined,
                                  //     color: Colors.red, size: 20),
                                ],
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(20 / 2),
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 50,
                              color: Colors.black12,
                            ),
                          ])),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: FavoriteButton(
                            iconSize: 35,
                            isFavorite: false,
                            iconColor: Theme.of(context).primaryColor,
                            // iconDisabledColor:
                            //     Theme.of(context).highlightColor,
                            valueChanged: (_isFavorite) {
                              print('Is Favorite : $_isFavorite');
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                ]),
              )),
        ),
      ],
    );
  }
}
