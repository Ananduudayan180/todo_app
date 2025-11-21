import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/extensions/space_exs.dart';
import 'package:todo_app/utils/app_colors.dart';
import 'package:todo_app/utils/app_str.dart';
import 'package:todo_app/utils/constants.dart';
import 'package:todo_app/views/home/components/fab.dart';
import 'package:todo_app/views/home/components/slider_drawer.dart';
import 'package:todo_app/views/home/widget/task_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<int> testing = [];
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,

      floatingActionButton: const Fab(),

      body: SliderDrawer(
        //custom drawer
        slider: CustomDrawer(),
        appBar: SizedBox(),
        child: _buildHomeBody(textTheme),
      ),
    );
  }

  //body function
  Widget _buildHomeBody(TextTheme textTheme) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          //AppBar delete button
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(CupertinoIcons.trash_circle, size: 40),
                  ),
                ),
                5.w,
              ],
            ),
          ),
          //Custom AppBar
          Container(
            margin: const EdgeInsets.only(top: 40),
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
                    valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
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
                  //task is not empty
                  ? ListView.builder(
                      itemCount: testing.length,
                      itemBuilder: (context, index) {
                        //task list tile
                        return Dismissible(
                          direction: DismissDirection.endToStart,
                          background: Container(
                            color: Colors.amber,
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.delete_outline, color: Colors.grey),
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
                  //task is empty
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 200,
                          width: 200,
                          child: Lottie.asset(lottieURL, animate: true),
                        ),
                        FadeInUp(
                          from: 30,
                          child: const Text(AppStr.doneAllTask),
                        ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
