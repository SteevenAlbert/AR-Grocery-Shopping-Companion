import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/components/categories_bar.dart';
import 'package:ar_grocery_companion/screens/home/components/header.dart';
import 'package:ar_grocery_companion/models/product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Header(size: size),
          const CategoriesBar(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 210, 209),
                  borderRadius: BorderRadius.circular(16)),
              child: Image.asset(products[0].image!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20 / 4),
            child: Text(products[0].title!,
                style: TextStyle(color: Color.fromARGB(255, 101, 100, 100))),
          ),
          const Text(
            "     \£\E 234",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              height: 180,
              width: 160,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 226, 210, 209),
                  borderRadius: BorderRadius.circular(16)),
              child: Image.asset(products[1].image!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20 / 4),
            child: Text(products[1].title!,
                style: TextStyle(color: Color.fromARGB(255, 101, 100, 100))),
          ),
          const Text(
            "     \£\E 234",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
