import 'package:flutter/material.dart';

class Background2 extends StatelessWidget {
  const Background2({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(
          // Theme.of(context).primaryColor, BlendMode.lighten),
          Theme.of(context).primaryColor.withOpacity(0.6),
          BlendMode.multiply),
      child: Image.asset(
        "assets/images/background/doodle.jpg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }
}