import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/features/theme/domain/theme_repository.dart';
import 'package:todo_app/features/theme/presentation/theme_controller.dart';

void main() {
  test('ThemeController toggles between light and dark mode', () async {
    final controller = ThemeController(FakeThemeRepository());

    expect(controller.themeMode, ThemeMode.light);

    await controller.toggleTheme(true);
    expect(controller.themeMode, ThemeMode.dark);

    await controller.toggleTheme(false);
    expect(controller.themeMode, ThemeMode.light);
  });
}

class FakeThemeRepository implements ThemeRepository {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  ThemeMode loadThemeMode() => _themeMode;

  @override
  Future<void> saveThemeMode(ThemeMode themeMode) async {
    _themeMode = themeMode;
  }
}
