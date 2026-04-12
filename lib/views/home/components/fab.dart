import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/views/tasks/task_view.dart';

class Fab extends StatelessWidget {
  const Fab({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) {
              return const TaskView(
                titleTaskController: null,
                descriptionTaskController: null,
                task: null,
              );
            },
          ),
        );
      },
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 10,
        color: Colors.transparent,
        shadowColor: Colors.black.withValues(
          alpha: Theme.of(context).brightness == Brightness.dark ? 0.35 : 0.2,
        ),
        child: Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: const Center(child: Icon(Icons.add, color: Colors.white)),
        ),
      ),
    );
  }
}
