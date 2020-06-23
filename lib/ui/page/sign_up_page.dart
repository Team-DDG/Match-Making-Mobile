import 'package:flutter/material.dart';
import 'package:match_making/ui/common/common_app_bar.dart';
import 'package:match_making/ui/common/common_button.dart';
import 'package:match_making/ui/common/common_text_field.dart';
import 'package:match_making/ui/styles.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: '회원가입'),
      body: Container(
        padding: padding48,
        child: Column(
          children: <Widget>[
            CommonTextField(hint: '이메일'),
            SizedBox(height: 10),
            CommonTextField(hint: '비밀번호'),
            SizedBox(height: 10),
            CommonTextField(hint: '비밀번호 확인'),
            Expanded(child: Container()),
            CommonButton(
              text: '회원가입',
              onPressed: () { Navigator.pushNamed(context, '/selfCertification'); },
              ),
          ],
        ),
      ),
    );
  }
}
