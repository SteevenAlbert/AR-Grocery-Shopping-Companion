import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning Samir",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "Wanna check some products?",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                  onTap: () => GoRouter.of(context).push("/profile_page"),
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/profilepic.jpeg"),
                    radius: 25,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
