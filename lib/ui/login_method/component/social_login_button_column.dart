import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:match_making/data/error/handling_method_type.dart';
import 'package:match_making/data/pref/pref_storage_impl.dart';
import 'package:match_making/data/service/social_login_service.dart';
import 'package:match_making/data/service/user_service.dart';
import 'package:match_making/enum/social_type.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/login_method/component/social_login_button.dart';
import 'package:match_making/ui/login_method/social_login_model.dart';
import 'package:provider/provider.dart';


class SocialLoginButtonColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SocialLoginModel(
          SocialLoginServiceImpl(PrefStorageImpl()), UserServiceImpl()),
      builder: (context, _) {
        return Column(
          children: <Widget>[
            Container(width: 40, height: 4, color: Colors.grey),
            SizedBox(height: 24),
            SocialLoginButton(
              color: colorSocialGoogle,
              text: 'Google 로그인',
              iconPath: 'assets/icons/ic_google_plus.png',
              onPressed: () => _onClickSocialLogin(context, SocialType.GOOGLE),
            ),
            SizedBox(height: 20),
            SocialLoginButton(
              color: colorSocialFacebook,
              text: 'Facebook 로그인',
              iconPath: 'assets/icons/ic_facebook.png',
              onPressed: () =>
                  _onClickSocialLogin(context, SocialType.FACEBOOK),
            ),
            SizedBox(height: 20),
            SocialLoginButton(
              color: colorSocialTwitter,
              text: 'Twitter 로그인',
              iconPath: 'assets/icons/ic_twitter.png',
              onPressed: () => _onClickSocialLogin(context, SocialType.TWITTER),
            )
          ],
        );
      },
    );
  }

  _onClickSocialLogin(BuildContext context, SocialType socialType) {
    context
        .read<SocialLoginModel>()
        .socialLogin(socialType)
        .then((value) => Navigator.pushNamed(context, '/main'))
        .catchError((err) => {
              if (err is Message)
                Fluttertoast.showToast(
                    msg: err.message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    backgroundColor: Colors.grey,
                    fontSize: 16.0)
              else if (err is Navigate)
                Navigator.pushNamed(context, err.route)
            });
  }
}
