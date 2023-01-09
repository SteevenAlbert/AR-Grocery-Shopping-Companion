import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Preferences")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Dark mode"),
            trailing: Switch(
                value: true,
                onChanged: (value) {
                  
                }),
          ),
        ],
      ),
    );
  }
}
