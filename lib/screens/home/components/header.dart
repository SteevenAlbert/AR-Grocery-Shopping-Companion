import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/screens/home/components/welcome.dart';
import 'package:ar_grocery_companion/screens/home/components/search_bar.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    double defaultPadding = 20.0;
    return Container(
      margin: EdgeInsets.only(bottom: defaultPadding),
      // It will cover 20% of our total height
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Welcome(size: size),
          const SearchBar(),
        ],
      ),
    );
  }
}
