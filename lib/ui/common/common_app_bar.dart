import 'package:flutter/material.dart';

class CommonAppBar extends AppBar {
  CommonAppBar({this.text, this.actionWidgets});

  final String text;
  final List<Widget> actionWidgets;

  @override
  double get elevation => 8;

  @override
  Widget get title => Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
      );

  @override
  ShapeBorder get shape => RoundedRectangleBorder(
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24)));

  @override
  List<Widget> get actions => actionWidgets;
}
