import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/common/common_app_bar.dart';
import 'package:match_making/ui/common/common_button.dart';
import 'package:match_making/ui/common/common_text_field.dart';

class EmailLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: '로그인'),
      body: Container(
        padding: EdgeInsets.only(left: 48, bottom: 48, right: 48, top: 36),
        child: Column(
          children: <Widget>[
            CommonTextField(hint: '이메일'),
            SizedBox(height: 10),
            CommonTextField(hint: '비밀번호'),
            SizedBox(height: 10),
            _buildAccountRow(),
            Expanded(child: Container()),
            CommonButton(
              text: '로그인',
            )
          ],
        ),
      ),
    );
  }

  _buildAccountRow() => Row(
        children: <Widget>[
          Text(
            '계정이 없으신가요?',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'RIXGOM',
              fontSize: 10,
            ),
          ),
          Expanded(child: Container()),
          Text(
            '비밀번호를 잊으셨나요?',
            style: TextStyle(
              fontSize: 10,
              color: colorLol,
              fontFamily: 'RIXGOM',
            ),
          )
        ],
      );
}
