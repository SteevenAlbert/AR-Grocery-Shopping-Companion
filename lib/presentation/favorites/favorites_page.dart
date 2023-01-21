import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:ar_grocery_companion/domain/models/user/app_user.dart';
import 'components/fav_prod_list.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:ar_grocery_companion/data/repositories/users_repository.dart';

class FavProductsPage extends StatelessWidget {
  final PersistentTabController controller;
  FavProductsPage({super.key, required this.controller});
  Future<AppUser?> getSessionUser() async {
    return await SessionManager()
        .get('UID')
        .then((UID) => AppUsersRepository.instance.fetchAppUser(UID));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 19.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text("My items",
                    style: TextStyle(
                        fontSize: 25,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w600))),
          ),
          FutureBuilder(
              future: getSessionUser(),
              builder: (context, AsyncSnapshot<AppUser?> snapshot) {
                if (snapshot.hasData) {
                  return FavProductsList(
                      height: MediaQuery.of(context).size.height,
                      controller: controller,
                      appUser: snapshot.data!);
                } else {
                  return FavProductsList(
                      height: MediaQuery.of(context).size.height,
                      controller: controller,
                      appUser: null);
                }
              })
        ],
      ),
    ));
  }
}
