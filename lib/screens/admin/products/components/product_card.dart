import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/models/product.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ProductCard extends StatefulWidget {
  final VoidCallback voidCallback;
  final Product product;
  final Function? press;
  const ProductCard({
    Key? key,
    required this.size,
    required this.product,
    required this.voidCallback,
    this.press,
  }) : super(key: key);

  final Size size;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {},
          child: Container(
              width: widget.size.width * 0.4,
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
                        child: Center(child: Image.asset(widget.product.image)),
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
                                  child: Text(
                                    widget.product.name,
                                    style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(20 / 2),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 5),
                              blurRadius: 50,
                              color: Colors.black12,
                            ),
                          ],
                        ),
                      ),
                      buildIconButton(),
                    ],
                  )
                ]),
              )),
        ),
      ],
    );
  }

  buildIconButton() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          onPressed: () async {
            return showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Deletion confirmation'),
                  content: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Text('Are you sure you want to delete this product'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: Text('Confirm'),
                      onPressed: () {
                        this.widget.voidCallback();
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).primaryColorLight,
          )),
    );
  }
}
