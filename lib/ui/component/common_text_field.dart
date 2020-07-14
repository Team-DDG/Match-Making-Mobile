import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';

class CommonTextField extends StatelessWidget {
  final bool obscureText;
  final TextEditingController controller;
  final String hintText;

  const CommonTextField(
      {Key key, this.obscureText:false, this.controller, this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: colorLol),
        ),
        hintText: hintText,
        hintStyle: TextStyle(fontFamily: 'RIXGOB', color: Colors.grey),
        contentPadding: EdgeInsets.only(left: 12),
      ),
      style: TextStyle(color: Colors.white, fontFamily: 'RIXGOB', fontSize: 16),
    );
  }
}
