import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:ar_grocery_companion/domain/models/user/app_user.dart';
import 'package:ar_grocery_companion/data/providers/favs_provider.dart';
import 'package:ar_grocery_companion/data/repositories/products_repository.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';

import 'fav_prod_tile.dart';

class FavProductsList extends ConsumerStatefulWidget {
  final height;
  final PersistentTabController controller;
  final AppUser? appUser;
  FavProductsList(
      {super.key,
      required this.height,
      required this.controller,
      required this.appUser});

  @override
  ConsumerState<FavProductsList> createState() => _FavProductsListState();
}

class _FavProductsListState extends ConsumerState<FavProductsList> {
  @override
  Widget build(BuildContext context) {
    List<String> favs = ref.watch(favsProvider);
    if (favs.isEmpty || widget.appUser == null) {
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
            Text("Your saved items will appear here.",
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => widget.controller.jumpToTab(0),
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
            final Product item =
                ProductsRepository.instance.getProduct(favs[index]);
            return Dismissible(
              // Each Dismissible must contain a Key. Keys allow Flutter to
              // uniquely identify widgets.
              key: Key(item.id.toString()),
              // Provide a function that tells the app
              // what to do after an item has been swiped away.
              onDismissed: (direction) {
                // Remove the item from the data source.
                ref.read(favsProvider.notifier).removeItem(item.id);
                widget.appUser!.favs = ref.read(favsProvider);
                ref.watch(favsProvider.notifier).update(widget.appUser!);
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
                      ref.read(favsProvider.notifier).addItem(item.id);
                      widget.appUser!.favs = ref.read(favsProvider);
                      ref.watch(favsProvider.notifier).update(widget.appUser!);
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
                  title: FavProduct(item: item),
                  trailing: FavoriteButton(
                    iconSize: 30,
                    isFavorite: true,
                    iconColor: Colors.red,
                    iconDisabledColor: Colors.amber.withOpacity(0.4),
                    valueChanged: (isFavorite) {
                      if (isFavorite) {
                        ref.read(favsProvider.notifier).addItem(item.id);
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
                                    color: Colors.white, letterSpacing: 0.3),
                              ),
                            ],
                          ),
                          action: SnackBarAction(
                            textColor: Colors.white,
                            label: 'Undo',
                            onPressed: () {
                              ref.read(favsProvider.notifier).addItem(item.id);
                              widget.appUser!.favs = ref.read(favsProvider);
                              ref
                                  .watch(favsProvider.notifier)
                                  .update(widget.appUser!);
                            },
                          ),
                        ));
                        ref.read(favsProvider.notifier).removeItem(item.id);
                        widget.appUser!.favs = ref.read(favsProvider);
                        ref
                            .watch(favsProvider.notifier)
                            .update(widget.appUser!);
                      }
                    },
                  ),
                  onTap: () {
                    GoRouter.of(context).pushNamed("ProductPage",
                        extra: item, params: {'fromAR': "false"});
                  },
                  dense: false,
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
