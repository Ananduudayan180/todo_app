import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:todo_app/utils/app_str.dart';

const String lottieURL = 'assets/lottie/Task.json';

dynamic emptyTaskWarning(BuildContext context) {
  return FToast.toast(
    context,
    msg: AppStr.oopsMsg,
    subMsg: 'You Must fill all fields!',
    corner: 20,
    duration: 2000,
    padding: const EdgeInsets.all(20),
  );
}

dynamic updateTaskWarning(BuildContext context) {
  return FToast.toast(
    context,
    msg: AppStr.oopsMsg,
    subMsg: 'You must edit the tasks then try to update it!',
    corner: 20,
    duration: 5000,
    padding: const EdgeInsets.all(20),
  );
}
