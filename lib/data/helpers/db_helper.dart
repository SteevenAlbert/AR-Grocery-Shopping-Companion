import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../firebase_options.dart';

//Struct to store database collection names as strings
class DBCollections {
  static String users = "appUsers";
  static String products = "products";
}

class FirebaseHelper {
  late DatabaseReference _dbRef;

  Future<void> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    _dbRef = FirebaseDatabase.instance.ref();
  }

  DatabaseReference get dbRef => _dbRef;

  static final FirebaseHelper instance = FirebaseHelper._();
  FirebaseHelper._();

  Future<DataSnapshot?> read(String path) async {
    DataSnapshot snapshot = await _dbRef.child(path).get();
    if (snapshot.exists) {
      return snapshot;
    } else {
      return null;
    }
  }

  //Not recommended, use writeUnique instead
  Future<bool> write(String path, dynamic data) async {
    return await _dbRef.set(data).then((_) {
      return true;
    }).catchError((error) {
      print(error);
      return false;
    });
  }

  Future<bool> writeUnique(String path, dynamic data) async {
    String? generatedKey = _dbRef.push().key;
    //assign generated key to the object's id
    // data["id"] = generatedKey;
    data.remove("id");
    path += "/$generatedKey";
    DatabaseReference newEntryRef = _dbRef.child(path);
    return await newEntryRef.set(data).then((_) {
      return true;
    }).catchError((error) {
      print(error);
      return false;
    });
  }

  Future<bool> append(String path, dynamic data) async {
    DatabaseReference newEntryRef = _dbRef.child(path);
    newEntryRef = newEntryRef.push();
    return await newEntryRef.set(data).then((_) {
      return true;
    }).catchError((error) {
      print(error);
      return false;
    });
  }

  Future<bool> update(String path, dynamic data) async {
    data.remove("id");
    return await _dbRef.child(path).update(data).then((_) {
      return true;
    }).catchError((error) {
      print(error);
      return false;
    });
  }

  Future<bool> delete(String path) async {
    return await _dbRef.child(path).remove().then((_) {
      return true;
    }).catchError((error) {
      print(error);
      return false;
    });
  }
}
