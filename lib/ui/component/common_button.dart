import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  CommonButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: onPressed,
      child: Container(
        height: 48,
        padding: EdgeInsets.only(top: 13, bottom: 13),
        decoration: BoxDecoration(
          border: Border.all(color: colorLol),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
