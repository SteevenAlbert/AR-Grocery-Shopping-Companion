import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/models/product.dart';

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
          width: 85,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(item.servingSize,
                  style: TextStyle(fontSize: 10, color: Colors.grey)),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Center(
                      child: Text(item.category!.title,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          )),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
