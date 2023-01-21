import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ar_grocery_companion/domain/models/user/app_user.dart';
import 'package:ar_grocery_companion/data/providers/favs_provider.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:go_router/go_router.dart';

class FavIcon extends StatefulWidget {
  const FavIcon(
      {super.key,
      required this.isFavo,
      required this.ref,
      required this.product,
      required this.darkMode,
      required this.appUser});
  final AppUser? appUser;
  final bool? isFavo;
  final WidgetRef ref;
  final Product product;
  final ThemeMode darkMode;
  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  @override
  Widget build(BuildContext context) {
    return widget.isFavo != null
        ? IconButton(
            onPressed: () {
              favLogic(widget.isFavo, widget.ref, widget.product, context,
                  widget.appUser!);
            },
            icon: widget.isFavo!
                ? Icon(Icons.favorite, size: 23, color: Colors.red)
                : Icon(Icons.favorite_border,
                    size: 23,
                    color: widget.darkMode == ThemeMode.light
                        ? Colors.amber.withOpacity(0.4)
                        : Theme.of(context).primaryColor))
        : IconButton(
            onPressed: () {
              context.go('/authenticate');
            },
            icon: Icon(Icons.favorite_border,
                size: 23,
                color: widget.darkMode == ThemeMode.light
                    ? Colors.amber.withOpacity(0.4)
                    : Theme.of(context).primaryColor),
          );
  }
}

favLogic(isFavo, WidgetRef ref, Product product, BuildContext context,
    AppUser appUser) {
  if (isFavo) {
    isFavo = false;
  } else {
    isFavo = true;
  }
  if (isFavo) {
    ref.read(favsProvider.notifier).addItem(product.id);
    appUser.favs = ref.read(favsProvider);
    print(appUser.favs);
    ref.watch(favsProvider.notifier).update(appUser);
  } else {
    ref.read(favsProvider.notifier).removeItem(product.id);
    appUser.favs = ref.read(favsProvider);
    print(appUser.favs);
    ref.watch(favsProvider.notifier).update(appUser);
  }
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    margin: const EdgeInsets.only(left: 50, right: 50, bottom: 70),
    elevation: 6.0,
    backgroundColor: Theme.of(context).primaryColor,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))),
    duration: const Duration(seconds: 2),
    content: isFavo
        ? Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 6),
              Text(
                'Item added to favorites',
                style: TextStyle(color: Colors.white, letterSpacing: 0.7),
              ),
            ],
          )
        : Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 4),
              Text(
                'Item removed from favorites',
                style: TextStyle(color: Colors.white, letterSpacing: 0.3),
              ),
            ],
          ),
  ));
}
