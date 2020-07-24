import 'package:flutter/material.dart';
import 'package:match_making/ui/login_method/component/social_login_button_column.dart';

class SocialLoginBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: <Widget>[
      Container(
          padding: EdgeInsets.only(left: 48, right: 48, bottom: 24, top: 14),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SocialLoginButtonColumn()
      ),
    ]);

  }
}
