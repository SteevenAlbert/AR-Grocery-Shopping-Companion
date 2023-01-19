import 'package:flutter/material.dart';

class ListCard extends StatelessWidget {
  ListCard(
      {super.key,
      required this.title,
      required this.trailing,
      required this.list});

  final String title;
  final Widget list;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  trailing: trailing,
                ),
                Expanded(child: list),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
