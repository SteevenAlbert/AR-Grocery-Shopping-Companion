import 'package:flutter/material.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:ar_grocery_companion/models/user/customer.dart';
import 'package:ar_grocery_companion/models/product.dart';

class FavIcon extends StatelessWidget {
  const FavIcon({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
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
        valueChanged: (_isFavorite) {
          Customer.favourites!.add(product);
        },
      ),
    );
  }
}
