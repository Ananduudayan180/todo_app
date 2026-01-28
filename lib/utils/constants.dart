import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
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

Future<PanaraInfoDialog?> noTaskWarning(BuildContext context) {
  return PanaraInfoDialog.showAnimatedGrow(
    context,
    title: AppStr.oopsMsg,
    message:
        'There is no Task For Delete!\n Try adding some and then try to delete it!',
    buttonText: 'Okay',
    onTapDismiss: () {
      Navigator.of(context).pop();
    },
    panaraDialogType: PanaraDialogType.warning,
  );
}

Future<PanaraInfoDialog?> deleteAllTasks(BuildContext context) {
  return PanaraConfirmDialog.show(
    context,
    title: AppStr.areYouSure,
    message:
        'Do You really want to delete all tasks? You will no be able to undo this action!',
    confirmButtonText: 'Yes',
    cancelButtonText: 'NO',
    panaraDialogType: PanaraDialogType.error,
    onTapConfirm: () {
      Navigator.of(context).pop();
      BaseWidget.of(context).dataStore.box.clear();
    },
    onTapCancel: () {
      Navigator.of(context).pop();
    },
  );
}
