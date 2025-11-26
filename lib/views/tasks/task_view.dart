import 'package:flutter/material.dart';
import 'package:todo_app/extensions/space_exs.dart';
import 'package:todo_app/utils/app_str.dart';
import 'package:todo_app/views/tasks/components/rep_textfield.dart';
import 'package:todo_app/views/tasks/widget/task_view_app_bar.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TextEditingController titleTaskController = TextEditingController();
  final TextEditingController descriptionTaskController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        //AppBar
        appBar: TaskViewAppBar(),
        //Body
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Top side texts
                _buildTopSideTexts(textTheme),

                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Title of TextFiled
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          AppStr.title0fTitleTextField,
                          style: textTheme.bodyLarge,
                        ),
                      ),
                      //Title TextFiled
                      RepTextField(controller: titleTaskController),
                      10.h,
                      //Description TextFiled
                      RepTextField(
                        controller: descriptionTaskController,
                        isForDescription: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
