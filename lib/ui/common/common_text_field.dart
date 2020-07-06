import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';

class CommonTextField extends TextField {
  CommonTextField({this.hint, this.obscureTextEnable = false});

  final String hint;
  final bool obscureTextEnable;

  @override
  bool get obscureText => obscureTextEnable;

  @override
  InputDecoration get decoration => InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorGray[600]),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorLol),
        ),
        hintText: hint,
        hintStyle: TextStyle(fontFamily: 'RIXGOB', color: colorGray[600]),
        contentPadding: EdgeInsets.only(left: 12),
      );

  @override
  TextStyle get style =>
      TextStyle(
          color: Colors.white,
          fontFamily: 'RIXGOB',
          fontSize: 16);
}
