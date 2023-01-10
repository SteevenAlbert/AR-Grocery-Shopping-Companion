import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/domain/models/user/customer.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavIcon extends StatefulWidget {
  const FavIcon({super.key, required this.product});
  final Product product;

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 41,
      height: 41,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 0.5,
          color: Colors.amber.withOpacity(0.45),
          style: BorderStyle.solid,
        ),
      ),
      child: Center(
        child: Consumer(
          builder: (_, WidgetRef ref, __) {
            ref.watch(favsProvider);
            bool isFavo =
                ref.watch(favsProvider.notifier).isFav(widget.product.id!);
            return Column(
              children: [
                IconButton(
                    onPressed: () {
                      if (isFavo) {
                        isFavo = false;
                      } else {
                        isFavo = true;
                      }
                      if (isFavo) {
                        ref
                            .read(favsProvider.notifier)
                            .addItem(widget.product.id!);
                      } else {
                        ref
                            .read(favsProvider.notifier)
                            .removeItem(widget.product.id!);
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        margin: const EdgeInsets.only(
                            left: 50, right: 50, bottom: 70),
                        elevation: 6.0,
                        backgroundColor: Theme.of(context).primaryColor,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        duration: const Duration(seconds: 1),
                        content: isFavo
                            ? Row(
                                children: [
                                  Icon(Icons.check_circle, color: Colors.white),
                                  SizedBox(width: 6),
                                  Text(
                                    'Item added to favorites',
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 0.7),
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Icon(Icons.check_circle, color: Colors.white),
                                  SizedBox(width: 4),
                                  Text(
                                    'Item removed from favorites',
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 0.3),
                                  ),
                                ],
                              ),
                      ));
                    },
                    icon: Icon(Icons.favorite,
                        size: 22,
                        color: isFavo
                            ? Colors.red
                            : Colors.amber.withOpacity(0.4)))
              ],
            );
          },
        ),
      ),
    );
  }
}
