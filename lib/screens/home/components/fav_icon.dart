import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:ar_grocery_companion/models/user/customer.dart';
import 'package:ar_grocery_companion/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavIcon extends ConsumerWidget {
  const FavIcon({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<int> favs = ref.watch(favsProvider);
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 0.5,
          color: Colors.amber.withOpacity(0.45),
          style: BorderStyle.solid,
        ),
      ),
      child: FavoriteButton(
        iconSize: 30,
        isFavorite: false,
        iconColor: Colors.red,
        iconDisabledColor: Colors.amber.withOpacity(0.4),
        valueChanged: (isFavorite) {
          if (isFavorite) {
            ref.read(favsProvider.notifier).addItem(product.id!);
          } else {
            ref.read(favsProvider.notifier).removeItem(product.id!);
          }
        },
      ),
    );
  }
}
