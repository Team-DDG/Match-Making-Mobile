import 'package:flutter/material.dart';
import 'package:match_making/data/pref/pref_storage_impl.dart';
import 'package:match_making/data/social/social_type.dart';
import 'package:match_making/data/social_login_service.dart';
import 'package:match_making/extension/context_ext.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/login_method/component/social_login_button.dart';
import 'package:match_making/ui/login_method/social_login_model.dart';
import 'package:provider/provider.dart';

class SocialLoginBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          SocialLoginModel(SocialLoginServiceImpl(PrefStorageImpl())),
      builder: (context, _) {
        return Wrap(children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 48, right: 48, bottom: 24, top: 14),
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
                  iconPath: 'assets/icons/ic_google_plus.png',
                  onPressed: () =>
                      _onClickSocialLogin(context, SocialType.GOOGLE),
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
                  onPressed: () =>
                      _onClickSocialLogin(context, SocialType.TWITTER),
                )
              ],
            ),
          ),
        ]);
      },
    );
  }

  _onClickSocialLogin(BuildContext context, SocialType socialType) {
    context
        .read<SocialLoginModel>()
        .socialLogin(socialType)
        .then((value) => Navigator.pushNamed(context, '/main'))
        .catchError((err) => context.showSnackbar(err.toString()));
  }
}
