import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Future<String> fetchSession() async {
    return await SessionManager().get('UID');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Profile")),
        body: FutureBuilder<String>(
            future: fetchSession(),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!);
              } else {
                return CircularProgressIndicator();
              }
            }));
  }
}
