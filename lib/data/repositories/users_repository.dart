import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import 'package:ar_grocery_companion/domain/models/user/app_user.dart';
import 'package:flutter/material.dart';

class AppUsersRepository {
  static final AppUsersRepository instance = AppUsersRepository._();

  DatabaseReference ref = FirebaseDatabase.instance.ref('/users');

  AppUsersRepository._();

  Future<bool> insertAppUser({required AppUser appUser}) async {
    try {
      return await ref
          .child(AppUser.path(appUser.UID))
          .set(appUser.toMap())
          .then((value) => true);
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
        "gender": appUser.gender,
        "favs": appUser.favs
      }).then((_) => true);
    } catch (e) {
      print("ERROR: " + e.toString());
      return false;
    }
  }

  Future<List<AppUser>?> fetchAppUsersList() async {
    try {
      List<AppUser> _appUsers = [];
      return await ref.get().then((snapshot) {
        Map<dynamic, dynamic> userMap =
            jsonDecode(jsonEncode(snapshot.value)) as Map<dynamic, dynamic>;
        userMap.forEach((key, value) {
          value['UID'] = key.substring(1);
          _appUsers.add(AppUser.fromMap(value));
        });
      }).then((value) => _appUsers);
    } catch (e) {
      print("ERROR: " + e.toString());
      return null;
    }
  }

  Future<AppUser?> fetchAppUser(String UID) async {
    try {
      return await ref.child(AppUser.path(UID)).get().then((snapshot) {
        Map<String, dynamic> userMap =
            jsonDecode(jsonEncode(snapshot.value)) as Map<String, dynamic>;
        userMap['UID'] = UID;
        print(userMap.runtimeType);
        return AppUser.fromMap(userMap);
      }).then((user) => user);
    } catch (e) {
      print("ERROR: " + e.toString());
      return null;
    }
  }

  int retrieveUsersCount(AsyncSnapshot snapshot) {
    Map data = snapshot.data.snapshot.value['users'];
    return data.length;
  }

  Future<List<String>?> fetchFavsList(String UID) async {
    DataSnapshot snapshot = await ref.child(AppUser.path(UID + "/favs")).get();
    List<String> favString = [];
    if (snapshot.exists) {
      List<dynamic> favs = snapshot.value as List<dynamic>;
      for (var fav in favs) {
        favString.add(fav as String);
      }
      return favString;
      // return snapshot.value as Map<dynamic, dynamic>;
    } else {
      return null;
    }
  }

  Future<bool> deleteAppUser(String UID) async {
    // TODO: implement this

    throw UnimplementedError();
  }
}
