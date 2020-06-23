import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/common/common_app_bar.dart';
import 'package:match_making/ui/common/common_button.dart';
import 'package:match_making/ui/common/common_text_field.dart';
import 'package:match_making/ui/styles.dart';

class EmailLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: '로그인'),
      body: Container(
        padding: padding48,
        child: Column(
          children: <Widget>[
            CommonTextField(hint: '이메일'),
            SizedBox(height: 10),
            CommonTextField(hint: '비밀번호'),
            SizedBox(height: 10),
            _buildAccountRow(context),
            Expanded(child: Container()),
            CommonButton(
              text: '로그인',
            )
          ],
        ),
      ),
    );
  }

  _buildAccountRow(BuildContext context) => Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/signup');
            },
            child: Text(
              '계정이 없으신가요?',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'RIXGOM',
                fontSize: 10,
              ),
            ),
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/findPassword');
            },
            child: Text(
              '비밀번호를 잊으셨나요?',
              style: TextStyle(
                fontSize: 10,
                color: colorLol,
                fontFamily: 'RIXGOM',
              ),
            ),
          )
        ],
      );
}
