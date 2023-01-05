import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/models/user/customer.dart';
import 'package:ar_grocery_companion/models/product.dart';
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
