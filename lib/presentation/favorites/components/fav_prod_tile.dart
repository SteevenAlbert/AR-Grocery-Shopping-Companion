import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';

class FavProduct extends StatelessWidget {
  final Product item;
  const FavProduct({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.name, style: TextStyle(fontSize: 14)),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(item.manufacturer.name,
                  style: TextStyle(fontSize: 10, color: Colors.grey)),
              Container(
                margin: EdgeInsets.all(4.0),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4.0),
                child: Text(item.category?.name ?? "Dairy",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    )),
                decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(500)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
