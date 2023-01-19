import 'package:ar_grocery_companion/presentation/profile/profile_page_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

import 'package:ar_grocery_companion/data/repositories/users_repository.dart';
import 'package:ar_grocery_companion/domain/models/user/app_user.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<AppUser?> getSessionUser() async {
    return await SessionManager()
        .get('UID')
        .then((UID) => AppUsersRepository.instance.fetchAppUser(UID));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Profile")),
        body: FutureBuilder(
            future: getSessionUser(),
            builder: (context, AsyncSnapshot<AppUser?> snapshot) {
              if (snapshot.hasData) {
                return ProfilePageForm(appUser: snapshot.data!);
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
