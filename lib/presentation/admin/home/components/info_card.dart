import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  InfoCard(
      {super.key,
      required this.title,
      required this.count,
      required this.icon});

  final String title;
  final int count;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).primaryColor.withOpacity(0.2),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      title: Text(
        count.toString(),
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      subtitle: Text(title, style: Theme.of(context).textTheme.bodySmall),
      trailing: Container(
        padding: EdgeInsets.all(8.0 / 2),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor, shape: BoxShape.circle),
        child: Icon(
          icon,
          color: Theme.of(context).canvasColor,
        ),
      ),
    );
  }
}
