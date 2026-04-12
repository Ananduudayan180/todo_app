import 'package:flutter/material.dart';
import 'package:todo_app/features/theme/domain/theme_repository.dart';

class ThemeController extends ChangeNotifier {
  ThemeController(this._themeRepository)
    : _themeMode = _themeRepository.loadThemeMode();

  final ThemeRepository _themeRepository;

  ThemeMode _themeMode;

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  Future<void> setThemeMode(ThemeMode themeMode) async {
    if (_themeMode == themeMode) {
      return;
    }

    _themeMode = themeMode;
    notifyListeners();
    await _themeRepository.saveThemeMode(themeMode);
  }

  Future<void> toggleTheme(bool isDarkModeEnabled) {
    return setThemeMode(isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light);
  }
}
