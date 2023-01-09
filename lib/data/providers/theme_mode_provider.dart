import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  late SharedPreferences prefs;

  Future _init() async {
    prefs = await SharedPreferences.getInstance();
    var isDarkMode = prefs.getBool("isDarkMode");
    isDarkMode = isDarkMode ?? SchedulerBinding.instance.platformDispatcher.platformBrightness == Brightness.dark;
    state = isDarkMode == true ? ThemeMode.dark : ThemeMode.light;
  }

  ThemeModeNotifier() : super(ThemeMode.light) {
    _init();
  }

  void toggle() async {
    if (state == ThemeMode.light)
      state = ThemeMode.dark;
    else if (state == ThemeMode.dark) state = ThemeMode.light;

    var isDarkMode = state == ThemeMode.dark;
    prefs.setBool("isDarkMode", isDarkMode);
  }
}

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>(
  (ref) => ThemeModeNotifier(),
);
