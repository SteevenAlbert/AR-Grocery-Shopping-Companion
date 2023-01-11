import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/models/product.dart';
import 'package:go_router/go_router.dart';

class ProductCard extends StatefulWidget {
  final VoidCallback voidCallback;
  final Product product;
  final Function? press;
  const ProductCard({
    Key? key,
    required this.product,
    required this.voidCallback,
    this.press,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => GoRouter.of(context)
          .push("/edit_product_page", extra: widget.product),
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
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: AspectRatio(
                  aspectRatio: 16 / 10,
                  child: Image.asset(
                    widget.product.images[0],
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        trailing: IconButton(
                          onPressed: () => buildIconButton(),
                          icon: Icon(Icons.delete_outline_outlined,
                              color: Theme.of(context).primaryColor),
                        ),
                        title: Text(
                          widget.product.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                        ),
                        subtitle: Text(
                          widget.product.producer,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
