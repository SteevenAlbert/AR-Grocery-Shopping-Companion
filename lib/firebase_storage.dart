import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FireStorage {
  static Future<bool> uploadFile({
    required String uploadPath,
    required String filePath,
  }) async {
    await FirebaseStorage.instance
        .ref()
        .child(uploadPath)
        .putFile(File(filePath))
        .then((success) {
      return true;
    });
    return false;
  }

  static Future<String> getUrl(String filePath) async {
    return FirebaseStorage.instance.ref().child(filePath).getDownloadURL();
  }
}
