import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import 'package:ar_grocery_companion/domain/models/user/app_user.dart';

class AppUsersRepository {
  static final AppUsersRepository instance = AppUsersRepository._();

  // List<AppUser> _appUsers = [];
  DatabaseReference ref = FirebaseDatabase.instance.ref('/users');

  // static AppUsersRepository? init() {
  //   AppUsersRepository AppUsersRepo = AppUsersRepository._();
  //   AppUsersRepo.fetchAppUsersList().then((_) {
  //     return AppUsersRepo;
  //   });
  // }

  AppUsersRepository._();

  Future<bool> insertAppUser({required AppUser appUser}) async {
    try {
      return await ref
          .child(AppUser.path(appUser.UID))
          .set(appUser.toMap())
          .then((value) => true);
      // .then((value) => this._appUsers.add(appUser));
    } catch (e) {
      print("ERROR: " + e.toString());
      return false;
    }
  }

  Future<bool> updateAppUser({required AppUser appUser}) async {
    try {
      return await ref.child(AppUser.path(appUser.UID)).update({
        "name": appUser.name,
        "DOB": appUser.DOB,
        "pfpPath": appUser.pfpPath,
        "gender": appUser.gender
      }).then((_) => true);
    } catch (e) {
      print("ERROR: " + e.toString());
      return false;
    }
  }

  Future<List<AppUser>> fetchAppUsersList() async {
    List<AppUser> _appUsers = [];
    return await ref.get().then((snapshot) {
      Map<dynamic, dynamic> userMap =
          jsonDecode(jsonEncode(snapshot.value)) as Map<dynamic, dynamic>;
      userMap.forEach((key, value) {
        value['UID'] = key.substring(1);
        _appUsers.add(AppUser.fromMap(value));
      });
    }).then((value) => _appUsers);
  }

  Future<AppUser?> fetchAppUser(String UID) async {
    return await ref.child(AppUser.path(UID)).get().then((snapshot) {
      Map<String, dynamic> userMap =
          jsonDecode(jsonEncode(snapshot.value)) as Map<String, dynamic>;
      userMap['UID'] = UID;
      print(userMap.runtimeType);
      return AppUser.fromMap(userMap);
    }).then((user) => user);
  }

  Future<bool> deleteAppUser(String UID) async {
    // TODO: implement this
    throw UnimplementedError();
  }

  // void reset() {
  //   // TODO: implement this
  //   throw UnimplementedError();
  // }

//   List<AppUser> getAppUsers() {
//     return this._appUsers;
//   }

//   AppUser getAppUser(String UID) {
//     return this._appUsers.firstWhere(
//           (AppUser element) => element.UID == UID,
//         );
//   }
}
