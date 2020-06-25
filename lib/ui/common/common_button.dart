import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';

class CommonButton extends FlatButton {
  CommonButton({this.text, this.onPressed});

  final String text;
  final VoidCallback onPressed;
  
  @override
  EdgeInsetsGeometry get padding => EdgeInsets.all(0);

  @override
  Widget get child => Container(
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
              fontFamily: 'RIXGOB',
              fontSize: 20,
            ),
          ),
        ),
      );
}
