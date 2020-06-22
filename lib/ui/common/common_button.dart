import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';

class CommonButton extends StatelessWidget {
  CommonButton({this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: null,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 13, bottom: 13),
        decoration: BoxDecoration(
          border: Border.all(color: colorLol),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'RIXGOB',
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
