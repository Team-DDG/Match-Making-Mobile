import 'package:flutter/material.dart';
import 'package:match_making/ui/common/common_button.dart';

class LoginMethodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            left: 48,
            right: 48,
            top: 70 + MediaQuery.of(context).padding.top,
            bottom: 48),
        child: Column(
          children: <Widget>[
            Image.asset('assets/logos/logo_main.png'),
            SizedBox(height: 30),
            Text(
              '든킨도나츠',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'RIXGOB',
              ),
            ),
            Expanded(child: Container()),
            CommonButton(text: '이메일로 로그인'),
            SizedBox(height: 24),
            CommonButton(text: '소셜 아이디로 로그인'),
          ],
        ),
      ),
    );
  }
}
