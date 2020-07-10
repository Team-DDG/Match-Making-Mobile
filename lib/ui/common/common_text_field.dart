import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';

class CommonTextField extends TextField {
  CommonTextField({this.hint, this.obscureTextEnable = false, this.textEditingController});

  final String hint;
  final bool obscureTextEnable;
  final TextEditingController textEditingController;

  @override
  bool get obscureText => obscureTextEnable;

  @override
  TextEditingController get controller => textEditingController;

  @override
  InputDecoration get decoration => InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorLol),
        ),
        hintText: hint,
        hintStyle: TextStyle(fontFamily: 'RIXGOB', color: Colors.grey),
        contentPadding: EdgeInsets.only(left: 12),
      );

  @override
  TextStyle get style =>
      TextStyle(
          color: Colors.white,
          fontFamily: 'RIXGOB',
          fontSize: 16);
}
