import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/common/common_app_bar.dart';
import 'package:match_making/ui/common/common_button.dart';
import 'package:match_making/ui/common/common_text_field.dart';
import 'package:match_making/ui/styles.dart';

class FindPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: '비밀번호 찾기'),
      body: Container(
        padding: padding48,
        child: Column(
          children: <Widget>[
            CommonTextField(hint: '비밀번호 찾기'),
            Expanded(child: Container()),
            CommonButton(
              text: '이메일 전송',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (dialogContext) => _buildDialog(dialogContext));
              },
            ),
          ],
        ),
      ),
    );
  }

  _buildDialog(BuildContext dialogContext) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorGray[900],
          ),
          child: Wrap(children: <Widget>[
            Column(
              children: <Widget>[
                Image.asset('assets/icons/ic_email_sent.png'),
                SizedBox(height: 8),
                Text(
                  '비밀번호 변경 메일을\n성공적으로 보냈습니다',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'RIXGOM',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(child: Container()),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(dialogContext);
                      },
                      child: Text(
                        '확인',
                        style: TextStyle(
                          fontSize: 18,
                          color: colorLol,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ]),
        ),
      );
}
