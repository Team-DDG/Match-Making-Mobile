import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  SocialLoginButton({this.color, this.text, this.iconPath, this.onPressed});

  final Color color;
  final String text;
  final String iconPath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(0),
      onPressed: onPressed,
      child: Container(
        color: color,
        padding: EdgeInsets.only(left: 14, right: 14, top: 12, bottom: 12),
        child: Row(
          children: [
            Image.asset(iconPath),
            SizedBox(width: 14),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}
