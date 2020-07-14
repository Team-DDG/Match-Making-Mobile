import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  void showSnackbar(String text) {
    Scaffold.of(this).showSnackBar(SnackBar(content: Text(text)));
  }
}