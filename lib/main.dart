import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/core/theme/app_theme.dart';
import 'package:todo_app/data/hive_data_store.dart';
import 'package:todo_app/features/theme/data/hive_theme_repository.dart';
import 'package:todo_app/features/theme/presentation/theme_controller.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/views/home/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<Task>(TaskAdapter());
  await Hive.openBox<Task>(HiveDataStore.taskBoxName);
  final settingsBox = await Hive.openBox<dynamic>(
    HiveThemeRepository.settingsBoxName,
  );

  runApp(
    AppScope(
      dataStore: HiveDataStore(),
      themeController: ThemeController(HiveThemeRepository(settingsBox)),
      child: const MyApp(),
    ),
  );
}

class AppScope extends InheritedWidget {
  const AppScope({
    super.key,
    required this.dataStore,
    required this.themeController,
    required super.child,
  });

  final HiveDataStore dataStore;
  final ThemeController themeController;

  static AppScope of(BuildContext context) {
    final appScope = context.dependOnInheritedWidgetOfExactType<AppScope>();
    if (appScope == null) {
      throw StateError('Could not find ancestor widget of type AppScope');
    }

    return appScope;
  }

  @override
  bool updateShouldNotify(covariant AppScope oldWidget) {
    return false;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = AppScope.of(context).themeController;

    return AnimatedBuilder(
      animation: themeController,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Hive Todo App',
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: themeController.themeMode,
          home: const HomeView(),
        );
      },
    );
  }
}
