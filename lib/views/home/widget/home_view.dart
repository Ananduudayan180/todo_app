import 'package:flutter/material.dart';
import 'package:todo_app/extensions/space_exs.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_str.dart';
import 'package:todo_app/views/home/components/fab.dart';
import 'package:todo_app/views/home/widget/task_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<int> testing = [1, 2, 1, 1];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton: Fab(),

      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            //Custom AppBar
            Container(
              margin: const EdgeInsets.only(top: 60),
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      value: 1 / 3,
                      backgroundColor: Colors.grey,
                      valueColor: AlwaysStoppedAnimation(
                        AppColors.primaryColor,
                      ),
                    ),
                  ),
                  25.w,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStr.mainTitle, style: textTheme.displayLarge),
                      3.h,
                      Text('1 of 3 task', style: textTheme.titleMedium),
                    ],
                  ),
                ],
              ),
              // color: Colors.amber,
            ),
            //Divider
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: const Divider(thickness: 2, indent: 100),
            ),
            //Tasks
            Expanded(
              child: SizedBox(
                width: double.infinity,
                child: testing.isNotEmpty
                    ? ListView.builder(
                        itemCount: testing.length,
                        itemBuilder: (context, index) {
                          //task
                          return Dismissible(
                            direction: DismissDirection.endToStart,
                            background: Container(
                              color: Colors.amber,
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.delete_outline,
                                    color: Colors.grey,
                                  ),
                                  10.w,
                                  Text(
                                    AppStr.deleteTask,
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            key: UniqueKey(),
                            child: TaskWidget(),
                          );
                        },
                      )
                    : Column(children: [Text('Image animation')]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
