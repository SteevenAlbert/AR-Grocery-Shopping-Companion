import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';

class CustomAnimatedButton extends StatelessWidget {
  CustomAnimatedButton({
    Key? key,
    required this.color,
    required this.text,
    required this.textColor,
    this.hasImage = false,
    this.image,
    required this.func,
  }) : super(key: key);
  final Color color;
  final String text;
  final Color textColor;
  final bool? hasImage;
  final String? image;
  final Function() func;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 15.0,
        ),
        child: AnimatedButton(
          shadowDegree: ShadowDegree.dark,
          width: MediaQuery.of(context).size.width / 1.75,
          height: MediaQuery.of(context).size.height / 13,
          color: color,
          child: Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 19,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              hasImage!
                  ? (Image.asset(
                      image!,
                      height: MediaQuery.of(context).size.height / 15,
                      width: MediaQuery.of(context).size.width / 8,
                    ))
                  : SizedBox(
                      width: 0,
                    )
            ],
          ),
          onPressed: func,
        ));
  }
}
