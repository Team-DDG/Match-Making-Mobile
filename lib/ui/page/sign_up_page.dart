import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:match_making/ui/common/common_app_bar.dart';
import 'package:match_making/ui/common/common_button.dart';
import 'package:match_making/ui/common/common_text_field.dart';
import 'package:match_making/ui/data/sign_up_service.dart';
import 'package:match_making/ui/styles.dart';
import 'package:match_making/ui/viewModel/sign_up_view_model.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordCheckController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordCheckController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SignUpViewModel(SignUpServiceImpl()),
        child: Consumer<SignUpViewModel>(
          builder: (_, model, __) {
            return Scaffold(
              appBar: CommonAppBar(text: '회원가입'),
              body: Container(
                padding: padding48,
                child: Column(
                  children: <Widget>[
                    CommonTextField(
                      hint: '이메일',
                      textEditingController: _emailController,
                    ),
                    SizedBox(height: 10),
                    CommonTextField(
                      hint: '비밀번호',
                      textEditingController: _passwordController,
                    ),
                    SizedBox(height: 10),
                    CommonTextField(
                      hint: '비밀번호 확인',
                      textEditingController: _passwordCheckController,
                    ),
                    Expanded(child: Container()),
                    CommonButton(
                      text: '회원가입',
                      onPressed: () async {
                        await model.signUp(
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                                _passwordCheckController.text.trim())
                            .then((value) {
                          if (value is Success) {
                            Navigator.pop(context);
                          } else if (value is Error) {
                            FlutterToast(context).showToast(
                              child: Text(
                                value.errorMessage,
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }
                        });
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
