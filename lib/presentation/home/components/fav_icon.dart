import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ar_grocery_companion/data/repositories/users_repository.dart';
import 'package:ar_grocery_companion/domain/models/user/app_user.dart';
import 'package:ar_grocery_companion/data/providers/favs_provider.dart';
import 'package:ar_grocery_companion/data/providers/theme_mode_provider.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'fav_icon2.dart';

class FavIcon extends StatefulWidget {
  const FavIcon({super.key, required this.product});
  final Product product;

  @override
  State<FavIcon> createState() => _FavIconState();
}

class _FavIconState extends State<FavIcon> {
  Future<AppUser?> getSessionUser() async {
    return await SessionManager()
        .get('UID')
        .then((UID) => AppUsersRepository.instance.fetchAppUser(UID));
  }

  @override
  Widget build(BuildContext context) {
    // FutureBuilder(
    //         future: getSessionUser(),
    //         builder: (context, AsyncSnapshot<AppUser?> snapshot) {
    //           if (snapshot.hasData) {
    //             return ProfilePageForm(appUser: snapshot.data!);
    //           } else {
    //             return Center(child: CircularProgressIndicator());
    //           }
    //         })
    return Container(
      child: Center(
        child: Consumer(
          builder: (_, WidgetRef ref, __) {
            var darkMode = ref.watch(themeModeProvider);
            ref.watch(favsProvider);
            bool isFavo =
                ref.watch(favsProvider.notifier).isFav(widget.product.id);
            return Column(
              children: [
                Container(
                  width: 37,
                  decoration: BoxDecoration(
                      color: darkMode == ThemeMode.light
                          ? Colors.amber.withOpacity(0.1)
                          : Theme.of(context).primaryColor.withOpacity(0.1),
                      shape: BoxShape.circle),
                  child: Center(
                    child: FutureBuilder(
                      future: getSessionUser(),
                      builder: (context, AsyncSnapshot<AppUser?> snapshot) {
                        if (snapshot.hasData) {
                          return FavIcon2(
                              isFavo: isFavo,
                              ref: ref,
                              product: widget.product,
                              darkMode: darkMode);
                        } else {
                          return FavIcon2(
                              isFavo: null,
                              ref: ref,
                              product: widget.product,
                              darkMode: darkMode);
                        }
                      },
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
