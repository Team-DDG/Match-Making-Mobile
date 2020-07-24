import 'package:flutter/material.dart';
import 'package:match_making/ui/component/common_button.dart';
import 'package:match_making/ui/login_method/component/social_login_bottom_sheet.dart';

class LoginMethodBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: 48,
          right: 48,
          bottom: 48,
          top: 70 + MediaQuery.of(context).padding.top),
      child: Column(
        children: <Widget>[
          Image.asset('assets/logos/logo_main.png'),
          SizedBox(height: 30),
          Text(
            '든킨도나츠',
            style: TextStyle(color: Colors.white, fontSize: 32),
          ),
          Expanded(child: Container()),
          CommonButton(
            text: '이메일로 로그인',
            onPressed: () {
              Navigator.pushNamed(context, '/login/email');
            },
          ),
          SizedBox(height: 24),
          CommonButton(
              text: '소셜 아이디로 로그인',
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    builder: (_) =>
                        SocialLoginBottomSheet(),
                    context: context);
              }),
        ],
      ),
    );
  }
}
