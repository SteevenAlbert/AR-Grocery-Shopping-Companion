import 'package:flutter/material.dart';
import 'package:ar_grocery_companion/models/user/customer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'fav_prod_tile.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ar_grocery_companion/models/product.dart';

class FavProductsList extends ConsumerStatefulWidget {
  final height;
  const FavProductsList({super.key, required this.height});

  @override
  ConsumerState<FavProductsList> createState() => _FavProductsListState();
}

class _FavProductsListState extends ConsumerState<FavProductsList> {
  @override
  Widget build(BuildContext context) {
    List<int> favs = ref.watch(favsProvider);
    if (favs.isEmpty) {
      final String assetName = 'assets/images/heart/empty_wishlist.svg';
      return Center(
        child: Column(
          children: [
            SizedBox(height: widget.height * 0.05),
            SvgPicture.asset(
              assetName,
              height: 300,
              width: 300,
            ),
            Text("You have no saved items in your list",
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).push('/'),
              child: Text("Browse Products", style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              )),
            ),
          ],
        ),
      );
    } else {
      return Container(
          child: ListView.builder(
        shrinkWrap: true,
        itemCount: favs.length,
        itemBuilder: (context, index) {
          final Product item = Product.retrieveProduct(favs[index])!;
          return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
              key: Key(item.id.toString()),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from the data source.
                ref.read(favsProvider.notifier).removeItem(item.id!);

                // Then show a snackbar.
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  margin:
                      const EdgeInsets.only(left: 50, right: 50, bottom: 70),
                  elevation: 6.0,
                  backgroundColor: Theme.of(context).primaryColor,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  duration: const Duration(seconds: 1),
                  content: Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.white),
                      SizedBox(width: 4),
                      Text(
                        'Item removed',
                        style:
                            TextStyle(color: Colors.white, letterSpacing: 0.3),
                      ),
                    ],
                  ),
                  action: SnackBarAction(
                    textColor: Colors.white,
                    label: 'Undo',
                    onPressed: () {
                      ref.read(favsProvider.notifier).addItem(item.id!);
                    },
                  ),
                ));
              },
              background: Container(
                  color: Colors.red,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Icon(
                        Icons.delete_rounded,
                        color: Colors.black,
                        size: 24.0,
                        semanticLabel: 'fav item',
                      ),
                    ),
                  )),
              child: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: ListTile(
                  horizontalTitleGap: 16.0,
                  leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    child: Container(
                        width: 79,
                        height: 79,
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        alignment: Alignment.center,
                        child: SimpleShadow(child: Image.asset(item.images[0])),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFFe5e5e5).withOpacity(0.5),
                        )),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FavProduct(item: item),
                      FavoriteButton(
                        iconSize: 30,
                        isFavorite: true,
                        iconColor: Colors.red,
                        iconDisabledColor: Colors.amber.withOpacity(0.4),
                        valueChanged: (isFavorite) {
                          if (isFavorite) {
                            ref.read(favsProvider.notifier).addItem(item.id!);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              margin: const EdgeInsets.only(
                                  left: 50, right: 50, bottom: 70),
                              elevation: 6.0,
                              backgroundColor: Theme.of(context).primaryColor,
                              behavior: SnackBarBehavior.floating,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              duration: const Duration(seconds: 1),
                              content: Row(
                                children: [
                                  Icon(Icons.check_circle, color: Colors.white),
                                  SizedBox(width: 4),
                                  Text(
                                    'Item removed',
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 0.3),
                                  ),
                                ],
                              ),
                              action: SnackBarAction(
                                textColor: Colors.white,
                                label: 'Undo',
                                onPressed: () {
                                  ref
                                      .read(favsProvider.notifier)
                                      .addItem(item.id!);
                                },
                              ),
                            ));
                            ref
                                .read(favsProvider.notifier)
                                .removeItem(item.id!);
                          }
                        },
                      ),
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
