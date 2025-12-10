import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/extensions/space_exs.dart';
import 'package:todo_app/models/task.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_str.dart';
import 'package:todo_app/views/home/components/date_time_selection.dart';
import 'package:todo_app/views/home/components/rep_textfield.dart';
import 'package:todo_app/views/tasks/task_view_app_bar.dart';

class TaskView extends StatefulWidget {
  const TaskView({
    super.key,
    required this.titleTaskController,
    required this.descriptionTaskController,
    required this.task,
  });

  final TextEditingController? titleTaskController;
  final TextEditingController? descriptionTaskController;
  final Task? task;
  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  String? title;
  String? subTitle;
  DateTime? time;
  DateTime? date;

  DateTime getInitialDateTime(DateTime? dateTime, bool isTimePicker) {
    if (isTimePicker
        ? widget.task?.createAtTime == null
        : widget.task?.createAtDate == null) {
      if (dateTime == null) {
        return DateTime.now();
      } else {
        return dateTime;
      }
    } else {
      return isTimePicker
          ? widget.task!.createAtTime
          : widget.task!.createAtDate;
    }
  }

  String showDate(DateTime? date) {
    if (widget.task?.createAtDate == null) {
      if (date == null) {
        return DateFormat('MMM-dd-yy').format(DateTime.now());
      } else {
        return DateFormat('MMM-dd-yy').format(date);
      }
    } else {
      return DateFormat('MMM-dd-yy').format(widget.task!.createAtDate);
    }
  }

  String showTime(DateTime? time) {
    if (widget.task?.createAtTime == null) {
      if (time == null) {
        return DateFormat('h:mm a').format(DateTime.now()).toString();
      } else {
        return DateFormat('h:mm a').format(time).toString();
      }
    } else {
      return DateFormat('h:mm a').format(widget.task!.createAtTime).toString();
    }
  }

  //if any task already exist return true otherwise false
  bool isTaskAlreadyExist() {
    if (widget.titleTaskController?.text == null &&
        widget.descriptionTaskController?.text == null) {
      return true; //add new task
    } else {
      return false; //update task
    }
  }

  dynamic getOrCreateTask() {}

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

                //Call Bottom Delete / Add buttons
                _buildBottomSideButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Bottom Delete / Add buttons widget
  Widget _buildBottomSideButtons() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                const Icon(Icons.close, color: AppColors.primaryColor),
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
            child: const Text(
              AppStr.addTaskString,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
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
              AppStr.titleOfTitleTextField,
              style: textTheme.bodyLarge,
            ),
          ),
          //Title TextFiled
          RepTextField(
            controller: widget.titleTaskController,
            onFieldSubmitted: (String inputTitle) {
              title = inputTitle;
            },
            onChanged: (String inputTitle) {
              title = inputTitle;
            },
          ),
          10.h,
          //SubTitle TextFiled
          RepTextField(
            controller: widget.descriptionTaskController,
            isForDescription: true,
            onFieldSubmitted: (String inputDescription) {
              subTitle = inputDescription;
            },
            onChanged: (String inputDescription) {
              subTitle = inputDescription;
            },
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
                      initDateTime: getInitialDateTime(time, true),
                      onChange: (dateTime, selectedIndex) {},
                      dateFormat: 'HH:mm',
                      onConfirm: (confirmTime, selectedIndex) {
                        setState(() {
                          if (widget.task?.createAtTime == null) {
                            time = confirmTime;
                          } else {
                            widget.task!.createAtTime = confirmTime;
                          }
                        });
                      },
                    ),
                  );
                },
              );
            },
            title: AppStr.timeString,
            dateOrTime: showTime(time),
          ),
          //Date picker container
          DateTimeSelectionWidget(
            onTap: () {
              DatePicker.showDatePicker(
                context,
                initialDateTime: getInitialDateTime(date, false),
                maxDateTime: DateTime(2030, 4, 5),
                minDateTime: DateTime.now(),
                onConfirm: (confirmDate, selectedIndex) {
                  setState(() {
                    if (widget.task?.createAtDate == null) {
                      date = confirmDate;
                    } else {
                      widget.task!.createAtDate = confirmDate;
                    }
                  });
                },
              );
            },
            title: AppStr.dateString,
            dateOrTime: showDate(date),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 100, child: Divider(thickness: 2)),
          RichText(
            text: TextSpan(
              text: isTaskAlreadyExist()
                  ? AppStr.addNewTask
                  : AppStr.updateCurrentTask,
              style: textTheme.titleLarge,
              children: [
                TextSpan(
                  text: AppStr.taskString,
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
