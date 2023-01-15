import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationManager {
  PushNotificationManager._();
  factory PushNotificationManager() => _instance;
  static final PushNotificationManager _instance = PushNotificationManager._();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool _initialized = false;

  Future<void> init() async {
    print("hii");
    if (!_initialized) {
      String? token = await _firebaseMessaging.getToken();
      print("My new token=$token");
      _initialized = true;
    }
  }
}
