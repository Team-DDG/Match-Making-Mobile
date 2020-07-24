import 'package:flutter/material.dart';
import 'package:match_making/data/error/handling_method_type.dart';
import 'package:match_making/extension/context_ext.dart';
import 'package:match_making/ui/component/common_button.dart';
import 'package:match_making/ui/component/common_text_field.dart';
import 'package:match_making/ui/component/progress_dialog.dart';
import 'package:match_making/ui/sign_up/sign_up_model.dart';
import 'package:match_making/ui/styles.dart';
import 'package:provider/provider.dart';

class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _reTypeController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _reTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding48,
      child: Column(
        children: <Widget>[
          CommonTextField(
            hintText: '이메일',
            controller: _emailController,
          ),
          SizedBox(height: 10),
          CommonTextField(
            hintText: '비밀번호',
            obscureText: true,
            controller: _passwordController,
          ),
          SizedBox(height: 10),
          CommonTextField(
            hintText: '비밀번호 확인',
            obscureText: true,
            controller: _reTypeController,
          ),
          Expanded(child: Container()),
          CommonButton(
            text: '회원가입',
            onPressed: () => _onClickSignUp(context),
          ),
        ],
      ),
    );
  }

  _onClickSignUp(BuildContext context) async {
    final progressDialog = getProgressDialog(context, '회원가입 중...');
    await progressDialog.show();
    context
        .read<SignUpModel>()
        .signUp(
          _emailController.text.trim(),
          _passwordController.text.trim(),
          _reTypeController.text.trim(),
        )
        .then((value) => Navigator.pop(context))
        .catchError((err) => context.showSnackbar((err as Message).message))
        .whenComplete(() async => await progressDialog.hide());
  }
}
