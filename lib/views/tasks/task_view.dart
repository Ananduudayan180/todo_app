import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
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

class DateTimeSelectionWidget extends StatelessWidget {
  const DateTimeSelectionWidget({
    super.key,
    required this.onTap,
    required this.title,
  });

  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    //Time picker container
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(20),
        width: double.infinity,
        height: 55,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              //left side time text
              child: Text(title, style: textTheme.titleMedium),
            ),
            //right side time container
            Container(
              margin: const EdgeInsets.only(right: 10),
              width: 80,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text(title, style: textTheme.titleSmall)),
            ),
          ],
        ),
      ),
    );
  }
}
