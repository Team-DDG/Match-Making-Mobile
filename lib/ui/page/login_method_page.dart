import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/common/common_button.dart';

class LoginMethodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            left: 48,
            right: 48,
            top: 70 + MediaQuery.of(context).padding.top,
            bottom: 48),
        child: Column(
          children: <Widget>[
            Image.asset('assets/logos/logo_main.png'),
            SizedBox(height: 30),
            Text(
              '든킨도나츠',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
              ),
            ),
            Expanded(child: Container()),
            CommonButton(
              text: '이메일로 로그인',
              onPressed: () {
                Navigator.pushNamed(context, '/emailLogin');
              },
            ),
            SizedBox(height: 24),
            CommonButton(
                text: '소셜 아이디로 로그인',
                onPressed: () {
                  _showSocialLoginBottomSheet(context);
                }),
          ],
        ),
      ),
    );
  }

  _showSocialLoginBottomSheet(BuildContext context) => showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) => Wrap(children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(left: 48, right: 48, bottom: 24, top: 14),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(width: 40, height: 4, color: Colors.grey),
                  SizedBox(height: 24),
                  SocialLoginButton(
                    color: colorSocialGoogle,
                    text: 'Google 로그인',
                    iconAsset: 'assets/icons/ic_google_plus.png',
                  ),
                  SizedBox(height: 20),
                  SocialLoginButton(
                    color: colorSocialFacebook,
                    text: 'Facebook 로그인',
                    iconAsset: 'assets/icons/ic_facebook.png',
                    onPress: () async {
                      final result = await FacebookLogin()
                          .logIn(['email', 'public_profile']);
                      final credential = FacebookAuthProvider.getCredential(
                          accessToken: result.accessToken.token);
                      final authResult = await FirebaseAuth.instance
                          .signInWithCredential(credential);
                    },
                  ),
                  SizedBox(height: 20),
                  SocialLoginButton(
                    color: colorSocialApple,
                    text: 'Apple 로그인',
                    iconAsset: 'assets/icons/ic_apple.png',
                  )
                ],
              ),
            ),
          ]));
}

class SocialLoginButton extends RaisedButton {
  SocialLoginButton({this.color, this.text, this.iconAsset, this.onPress});

  final Color color;
  final String text;
  final String iconAsset;
  final VoidCallback onPress;

  @override
  EdgeInsetsGeometry get padding => EdgeInsets.all(0);

  @override
  Widget get child => GestureDetector(
        onTap: onPress,
        child: Container(
          color: color,
          padding: EdgeInsets.only(left: 14, top: 12, bottom: 12, right: 14),
          child: Row(
            children: <Widget>[
              Image.asset(iconAsset),
              SizedBox(width: 14),
              Expanded(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
