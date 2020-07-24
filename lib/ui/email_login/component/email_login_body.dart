import 'package:flutter/material.dart';
import 'package:match_making/extension/context_ext.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/component/common_button.dart';
import 'package:match_making/ui/component/common_text_field.dart';
import 'package:match_making/ui/component/progress_dialog.dart';
import 'package:match_making/ui/email_login/email_login_model.dart';
import 'package:match_making/ui/styles.dart';
import 'package:provider/provider.dart';

class EmailLoginBody extends StatefulWidget {
  @override
  _EmailLoginBodyState createState() => _EmailLoginBodyState();
}

class _EmailLoginBodyState extends State<EmailLoginBody> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<EmailLoginModel>(
      builder: (context, model, _) {
        return Container(
          padding: padding48,
          child: Column(
            children: <Widget>[
              CommonTextField(
                hintText: '이메일',
                controller: emailController,
              ),
              SizedBox(height: 10),
              CommonTextField(
                hintText: '비밀번호',
                obscureText: true,
                controller: passwordController,
              ),
              SizedBox(height: 10),
              _buildAccountRow(context),
              Expanded(child: Container()),
              CommonButton(
                text: '로그인',
                onPressed: () => _onClickLogin(context, model),
              ),
            ],
          ),
        );
      },
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
          Navigator.pushNamed(context, '/password/find');
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

  _onClickLogin(BuildContext context, EmailLoginModel model) async {
    final progressDialog = getProgressDialog(context, '로그인 중...');
    await progressDialog.show();
    model
        .login(emailController.text.trim(), passwordController.text.trim())
        .then((value) => Navigator.pushNamed(context, '/main'))
        .catchError((err) => context.showSnackbar(err))
        .whenComplete(() async => await progressDialog.hide());
  }
}
