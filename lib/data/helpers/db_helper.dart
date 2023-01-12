import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../firebase_options.dart';

class FirebaseHelper {
  static late DatabaseReference _dbRef;

  Future<void> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    _dbRef = FirebaseDatabase.instance.ref();
  }

  DatabaseReference get dbRef => _dbRef;

  //read from firebase
  static Future<DataSnapshot?> read(String path) async {
    DataSnapshot snapshot = await _dbRef.child(path).get();
    if (snapshot.exists) {
      return snapshot;
    } else {
      return null;
    }
  }
}
