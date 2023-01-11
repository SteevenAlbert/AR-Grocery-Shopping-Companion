import 'package:flutter/material.dart';

class Background1 extends StatelessWidget {
  final Widget child;

  const Background1({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Positioned(
          //   top: 0,
          //   right: 0,
          //   child: Image.asset(
          //     "assets/images/background/top1.png",
          //     width: size.width,
          //     // color: Colors.transparent.withOpacity(0.1),
          //   ),
          // ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              "assets/images/background/top2.png",
              width: size.width,
            ),
          ),
          child
        ],
      ),
    );
  }
}