import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';

class CommonTextField extends TextField {
  CommonTextField({this.hint});

  final String hint;

  @override
  InputDecoration get decoration => InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[600]),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorLol),
        ),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey[600]),
        contentPadding: EdgeInsets.only(left: 12),
      );

  @override
  TextStyle get style => TextStyle(
    color: Colors.white,
    fontSize: 16
  );
}
