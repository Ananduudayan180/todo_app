import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:todo_app/extensions/space_exs.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_str.dart';
import 'package:todo_app/views/tasks/components/date_time_selection.dart';
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
                //Call Top side texts
                _buildTopSideTexts(textTheme),
                //Call Main task view activity
                _buildMainTaskViewActivity(textTheme, context),
                //delete button
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Delete current task button
                      MaterialButton(
                        onPressed: () {
                          //Delete task
                        },
                        minWidth: 150,
                        height: 55,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.close,
                              color: AppColors.primaryColor,
                            ),
                            5.w,
                            const Text(
                              AppStr.deleteTask,
                              style: TextStyle(color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),

                      //Add or update task button
                       MaterialButton(
                        onPressed: () {
                          //add or update task
                        },
                        minWidth: 150,
                        height: 55,
                        color: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child:const Text(
                              AppStr.addTaskString,
                              style: TextStyle(color: Colors.white),
                            ),
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
  //Main task view activity widget
  Widget _buildMainTaskViewActivity(TextTheme textTheme, BuildContext context) {
    return SizedBox(
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
                    //Time picker container
                    DateTimeSelectionWidget(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (ctx) {
                            return SizedBox(
                              height: 254,
                              child: TimePickerWidget(
                                onChange: (dateTime, selectedIndex) {},
                                dateFormat: 'HH:mm',
                                onConfirm: (dateTime, selectedIndex) {},
                              ),
                            );
                          },
                        );
                      },
                      title: AppStr.timeString,
                    ),
                    //Date picker container
                    DateTimeSelectionWidget(
                      onTap: () {
                        DatePicker.showDatePicker(
                          context,
                          maxDateTime: DateTime(2030, 4, 5),
                          minDateTime: DateTime.now(),
                          onConfirm: (dateTime, selectedIndex) {},
                        );
                      },
                      title: AppStr.dateString,
                    ),
                  ],
                ),
              );
  }
  //Top side texts widget
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