import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/models/user/customer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class FavProductsList extends StatefulWidget {
  const FavProductsList({super.key});

  @override
  State<FavProductsList> createState() => _FavProductsListState();
}

class _FavProductsListState extends State<FavProductsList> {
  @override
  Widget build(BuildContext context) {
    if (Customer.favourites == null || Customer.favourites!.isEmpty) {
      final String assetName = 'images/heart/heart-circle-plus-custom.svg';
      return Center(
        child: Container(
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
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  margin:
                      const EdgeInsets.only(left: 50, right: 50, bottom: 70),
                  backgroundColor: Color(0xFFe5e5e5),
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 1),
                  content: Text(
                    '${item.name} removed',
                    style: TextStyle(color: Colors.black),
                  ),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {},
                  ),
                ));
              },
              background: Container(
                  color: Colors.red.withOpacity(0.8),
                  child: Icon(
                    Icons.delete_rounded,
                    color: Colors.black,
                    size: 24.0,
                    semanticLabel: 'fav item',
                  )),
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: ListTile(
                  horizontalTitleGap: 16.0,
                  leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    // onTap: () {},

                    child: Container(
                        width: 79,
                        height: 79,
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        alignment: Alignment.center,
                        child: Image.asset(item.image),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFe5e5e5),
                        )),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.name, style: TextStyle(fontSize: 14)),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(item.category!.title,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    )),
                              ),
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.3),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.pink,
                        size: 24.0,
                        semanticLabel: 'fav item',
                      )
                    ],
                  ),
                  onTap: () {
                    GoRouter.of(context).push("/product_page", extra: item);
                  },
                  dense: false,
                ),
              ));
        },
      ));
    }
  }
}
