import 'package:flutter/material.dart';
import 'package:todo_app/utils/app_str.dart';
import 'package:todo_app/views/tasks/widget/task_view_app_bar.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      //AppBar
      appBar: TaskViewAppBar(),

      //body
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            _buildTopSideTexts(textTheme),
          ],
        ),
      ),
    );
  }

  SizedBox _buildTopSideTexts(TextTheme textTheme) {
    return SizedBox(
            width: double.infinity,
            height: 100,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 100, child: Divider(thickness: 2)),
                RichText(
                  text: TextSpan(
                    text: AppStr.addNewTask,
                    style: textTheme.titleLarge,
                    children: [
                      TextSpan(
                        text: AppStr.taskStrnig,
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 100, child: Divider(thickness: 2)),
              ],
            ),
          );
  }
}
