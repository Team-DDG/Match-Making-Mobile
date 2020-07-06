import 'dart:core';

import 'package:flutter/material.dart';
import 'package:match_making/ui/common/common_app_bar.dart';
import 'package:match_making/ui/common/common_button.dart';
import 'package:match_making/ui/common/common_text_field.dart';

class ChangePasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(text: '비밀번호 변경'),
        body: Container(
          padding: EdgeInsets.only(left: 48, right: 48, bottom: 48),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 24,
              ),
              CommonTextField(
                hint: '기존 비밀번호',
                obscureTextEnable: true,
              ),
              CommonTextField(
                hint: '신규 비밀번호',
                obscureTextEnable: true,
              ),
              CommonTextField(
                hint: '신규 비밀번호 확인',
                obscureTextEnable: true,
              ),
              Expanded(
                child: Container(),
              ),
              CommonButton(
                text: '비밀번호 변경',
                onPressed: () {  },
              )
            ],
          ),
        ));
  }
}
