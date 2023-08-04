import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final themeControllerProvider =
    StateProvider<ThemeMode>((ref) => ThemeMode.light);
final themePreferences = Provider((ref) => ThemePreferences(ref: ref));

class ThemePreferences {
  final Ref ref;
  ThemePreferences({
    required this.ref,
  });
  static const _themeKey = 'theme';

  Future<void> changeTheme(ThemeMode themeMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(_themeKey, themeMode.index);
    ref.read(themeControllerProvider.notifier).state = themeMode;
  }

  Future getTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeIndex = prefs.getInt(_themeKey) ?? ThemeMode.system.index;
    // return ThemeMode.values[themeIndex];
    ref.read(themeControllerProvider.notifier).state =
        ThemeMode.values[themeIndex];
  }
}
