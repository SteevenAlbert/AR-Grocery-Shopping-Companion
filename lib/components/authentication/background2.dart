import 'package:flutter/material.dart';

class Background2 extends StatelessWidget {
  const Background2({super.key});

  @override
  Widget build(BuildContext context) {
    return ColorFiltered(
      colorFilter: ColorFilter.mode(Colors.tealAccent, BlendMode.darken),
      child: Image.asset(
        "assets/images/background/doodle.jpg",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
