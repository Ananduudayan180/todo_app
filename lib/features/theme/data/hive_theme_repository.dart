import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/features/theme/domain/theme_repository.dart';

class HiveThemeRepository implements ThemeRepository {
  HiveThemeRepository(this._box);

  static const String settingsBoxName = 'app_settings';
  static const String themeModeKey = 'theme_mode';

  final Box<dynamic> _box;

  @override
  ThemeMode loadThemeMode() {
    final isDarkMode = _box.get(themeModeKey, defaultValue: false) as bool;
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }

  @override
  Future<void> saveThemeMode(ThemeMode themeMode) {
    return _box.put(themeModeKey, themeMode == ThemeMode.dark);
  }
}
