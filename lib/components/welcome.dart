import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    double defaultPadding = 20.0;
    return Container(
      padding: EdgeInsets.only(
        left: defaultPadding,
        right: defaultPadding,
      ),
      height: size.height * 0.2 - 27,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      child: Row(
        children: <Widget>[
          Text(
            'Welcome back!',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
