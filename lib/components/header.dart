import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/components/welcome.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    double defaultPadding = 8.0;
    return Container(
      margin: EdgeInsets.only(bottom: defaultPadding),
      // It will cover 20% of our total height
      height: size.height * 0.099,
      child: Stack(
        children: <Widget>[
          Welcome(size: size),
        ],
      ),
    );
  }
}
