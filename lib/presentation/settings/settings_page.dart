import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ar_grocery_companion/utils.dart';

import '../../data/providers/theme_mode_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeMode = ref.watch(themeModeProvider);
    return Scaffold(
      appBar: buildAppBar(context: context, title: "Settings"),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Dark mode"),
            trailing: Switch(
              value: themeMode == ThemeMode.dark,
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
