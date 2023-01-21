import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ar_grocery_companion/data/repositories/users_repository.dart';
import 'package:ar_grocery_companion/domain/models/user/app_user.dart';
import 'package:ar_grocery_companion/data/providers/favs_provider.dart';
import 'package:ar_grocery_companion/data/providers/theme_mode_provider.dart';
import 'package:ar_grocery_companion/domain/models/product/product.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'fav_icon.dart';

class FavIconContainer extends StatefulWidget {
  const FavIconContainer({super.key, required this.product});
  final Product product;

  @override
  State<FavIconContainer> createState() => _FavIconContainerState();
}

class _FavIconContainerState extends State<FavIconContainer> {
  Future<AppUser?> getSessionUser() async {
    return await SessionManager()
        .get('UID')
        .then((UID) => AppUsersRepository.instance.fetchAppUser(UID));
  }

  @override
  Widget build(BuildContext context) {
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
                          return FavIcon(
                              isFavo: isFavo,
                              ref: ref,
                              product: widget.product,
                              darkMode: darkMode,
                              appUser: snapshot.data!);
                        } else {
                          return FavIcon(
                              isFavo: null,
                              ref: ref,
                              product: widget.product,
                              darkMode: darkMode,
                              appUser: null);
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
