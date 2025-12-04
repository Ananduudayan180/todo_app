import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/hive_data_store.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/views/home/home_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Task>(TaskAdapter());
  final box = await Hive.openBox<Task>(HiveDataStore.taskBoxName);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Hive Todo App',
      theme: ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: Colors.black,
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          displayMedium: TextStyle(color: Colors.white, fontSize: 21),
          displaySmall: TextStyle(
            color: Color.fromARGB(255, 234, 234, 234),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: HomeView(),
    );
  }
}
