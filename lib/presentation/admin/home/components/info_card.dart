import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).primaryColor.withOpacity(0.2),
      shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
      title: Text(
        "60",
        style: Theme.of(context).textTheme.headlineMedium,
      ),
      subtitle: Text("Users", style: Theme.of(context).textTheme.bodySmall),
      trailing: Container(
        padding: EdgeInsets.all(8.0 / 2),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor, shape: BoxShape.circle),
        child: Icon(
          Icons.supervised_user_circle,
          color: Theme.of(context).canvasColor,
        ),
      ),
    );
  }
}
