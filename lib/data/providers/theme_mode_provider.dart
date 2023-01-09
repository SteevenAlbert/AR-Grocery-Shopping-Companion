import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeNotifier extends StateNotifier<bool> {
  late SharedPreferences prefs;

  Future _init() async {
    prefs = await SharedPreferences.getInstance();
    var isDarkMode = prefs.getBool("isDarkMode");
    state = isDarkMode ?? false;
  }

  ThemeModeNotifier() : super(false) {
    _init();
  }

  void toggle() async {
    state = !state;
    prefs.setBool("isDarkMode", state);
  }
}

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, bool>(
  (ref) => ThemeModeNotifier(),
);