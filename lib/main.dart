import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/page/email_login_page.dart';
import 'package:match_making/ui/page/find_password_page.dart';
import 'package:match_making/ui/page/login_method_page.dart';
import 'package:match_making/ui/page/self_certification_page.dart';
import 'package:match_making/ui/page/sign_up_page.dart';

void main() {
  runApp(MatchMakingApp());
}

class MatchMakingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/loginMethod',
      routes: {
        '/loginMethod': (_) => LoginMethodPage(),
        '/emailLogin': (_) => EmailLoginPage(),
        '/findPassword': (_) => FindPasswordPage(),
        '/signup': (_) => SignUpPage(),
        '/selfCertification': (_) => SelfCertificationPage(),
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF191919),
        ),
        scaffoldBackgroundColor: colorBackground,
      ),
    );
  }
}
