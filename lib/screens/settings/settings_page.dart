import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers/theme_mode_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var darkMode = ref.watch(themeModeProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Preferences")),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Dark mode"),
            trailing: Switch(
              value: darkMode,
              onChanged: (value) {
                ref.read(themeModeProvider.notifier).toggle();
              },
            ),
          ),
        ],
      ),
    );
  }
}
