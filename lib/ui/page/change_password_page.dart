import 'dart:core';

import 'package:flutter/material.dart';
import 'package:match_making/ui/common/common_app_bar.dart';

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
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '기존 비밀번호',
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '신규 비밀번호',
                ),
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: '신규 비밀번호 확인',
                ),
              ),
              Expanded(
                child: Container(),
              ),
              MaterialButton(
                onPressed: () {},
                color: Colors.lightBlue,
                child: Text(
                  '비밀번호 변경',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ));
  }
}
