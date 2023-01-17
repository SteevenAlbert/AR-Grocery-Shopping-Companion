import 'package:ar_grocery_companion/domain/models/user/app_user.dart';
import 'package:firebase_database/firebase_database.dart';

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

  Future<bool> updateAppUser() async {
    //TODO: add parameters(name, DOB, pfp, gender) and implement this
    // ref(appUser.path())
    // .set({"name": name})
    // .then((_) {
    //     // Data saved successfully!
    // })
    // .catchError((error) {
    //     // The write failed...
    // });
    return false;
  }

  Future<List<AppUser>> fetchAppUsersList() async {
    List<AppUser> _appUsers = [];
    return await ref.get().then((snapshot) {
      Map<dynamic, dynamic> userMap = snapshot.value as Map<dynamic, dynamic>;
      userMap.forEach((key, value) {
        value['UID'] = key.substring(1);
        _appUsers.add(AppUser.fromMap(value));
      });
    }).then((value) => _appUsers);
  }

  Future<AppUser?> fetchAppUser(String UID) async {
    return await ref.child(AppUser.path(UID)).get().then((snapshot) {
      Map<dynamic, dynamic> userMap = snapshot.value as Map<dynamic, dynamic>;
      userMap['UID'] = UID;
      return AppUser.fromMap(userMap as Map<String, dynamic>);
    }).then((user) => user);
  }

  Future<int> deleteAppUser(String UID) async {
    // TODO: implement this
    throw UnimplementedError();
  }

  void reset() {
    // TODO: implement this
    throw UnimplementedError();
  }

//   List<AppUser> getAppUsers() {
//     return this._appUsers;
//   }

//   AppUser getAppUser(String UID) {
//     return this._appUsers.firstWhere(
//           (AppUser element) => element.UID == UID,
//         );
//   }
}
