import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/models/user/customer.dart';
import 'package:flutter_svg/svg.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    if (Customer.favourites == null) {
      final String assetName = 'images/heart/heart-circle-plus-custom.svg';
      // final Widget blobSVG =
      return Container(
        width: 80,
        height: 80,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SvgPicture.asset(
          assetName,
          height: 100,
          width: 100,
        ),
      );
    } else {
      return Container(
          child: ListView.builder(
        itemCount: Customer.favourites!.length,
        itemBuilder: (context, index) {
          final item = Customer.favourites![index];
          return Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(item.id.toString()),
            // Provide a function that tells the app
            // what to do after an item has been swiped away.
            onDismissed: (direction) {
              // Remove the item from the data source.
              setState(() {
                Customer.favourites!.removeAt(index);
              });

              // Then show a snackbar.
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text('$item dismissed')));
            },
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text(item.name!),
            ),
          );
        },
      ));
    }
  }
}
