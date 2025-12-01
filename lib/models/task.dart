import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String subtitle;

  @HiveField(3)
  DateTime createAtTime;

  @HiveField(4)
  DateTime createAtDate;

  @HiveField(5)
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.createAtTime,
    required this.createAtDate,
    required this.isCompleted,
  });

  factory Task.create({
    required String? title,
    required String? subtitle,
    DateTime? createAtTime,
    DateTime? createAtDate,
  }) {
    return Task(
      id: const Uuid().v4(),
      title: title ?? "",
      subtitle: subtitle ?? "",
      createAtTime: createAtTime ?? DateTime.now(),
      createAtDate: createAtTime ?? DateTime.now(),
      isCompleted: false,
    );
  }
}
