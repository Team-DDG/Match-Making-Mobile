import 'package:flutter/material.dart';
import 'package:match_making/ui/common/common_app_bar.dart';
import 'package:match_making/ui/common/common_button.dart';
import 'package:match_making/ui/common/common_text_field.dart';
import 'package:match_making/ui/styles.dart';

class SignUpPage extends StatelessWidget {
  TextEditingController _emailText = TextEditingController();
  TextEditingController _passWord = TextEditingController();
  TextEditingController _passWordCheck = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: '회원가입'),
      body: Container(
        padding: padding48,
        child: Column(
          children: <Widget>[
            CommonTextField(
              hint: '이메일',
              textEditingController: _emailText,
            ),
            SizedBox(height: 10),
            CommonTextField(
              hint: '비밀번호',
              textEditingController: _passWord,
            ),
            SizedBox(height: 10),
            CommonTextField(
              hint: '비밀번호 확인',
              textEditingController: _passWordCheck,
            ),
            Expanded(child: Container()),
            CommonButton(
              text: '회원가입',
              onPressed: () {
                if (_passWord.text != _passWordCheck.text) {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('비밀번호가 다릅니다.')));
                } else {

                  Navigator.pushNamed(context, '/selfCertification');
                }
              },
            ),
          ],
        ),
      ),
  }
}
