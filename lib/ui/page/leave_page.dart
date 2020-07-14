import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_making/ui/component/common_app_bar.dart';
import 'package:match_making/ui/component/common_button.dart';
import 'package:match_making/ui/component/common_text_field.dart';

class LeavePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: '회원탈퇴'),
      body: Container(
        padding: EdgeInsets.all(48),
        child: Column(
          children: <Widget>[
            CommonTextField(
              hintText: '비밀번호 확인',
            ),
            Expanded(child: Container()),
            CommonButton(
              text: '회원탈퇴',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
