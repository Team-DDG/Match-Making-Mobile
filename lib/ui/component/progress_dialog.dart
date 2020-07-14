import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog getProgressDialog(BuildContext context, String message) {
  return ProgressDialog(
    context,
    type: ProgressDialogType.Normal,
    isDismissible: false,
    showLogs: false,
  )..style(message: message);
}
