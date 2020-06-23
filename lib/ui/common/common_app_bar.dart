import 'package:flutter/material.dart';

class CommonAppBar extends AppBar {
  CommonAppBar({this.text});

  final String text;

  @override
  double get elevation => 8;

  @override
  Widget get title => Text(
        text,
        style: TextStyle(
          fontFamily: 'RIXGOB',
          fontSize: 18,
          color: Colors.white,
        ),
      );

  @override
  ShapeBorder get shape => RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24)));
}
