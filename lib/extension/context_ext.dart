import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

extension ContextExt on BuildContext {
  void showSnackbar(String text) {
    Scaffold.of(this).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<ProgressDialog> showAndGetProgressDialog(String message) async {
    final progressDialog = ProgressDialog(
      this,
      type: ProgressDialogType.Normal,
      isDismissible: false,
      showLogs: false
    )..style(message: message);
    await progressDialog.show();
    return progressDialog;
  }
}