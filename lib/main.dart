import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/email_login/email_login_page.dart';
import 'package:match_making/ui/page/change_password_page.dart';
import 'package:match_making/ui/page/find_password_page.dart';
import 'package:match_making/ui/page/input_keyword_page.dart';
import 'package:match_making/ui/page/input_lol_page.dart';
import 'package:match_making/ui/page/input_profile_page.dart';
import 'package:match_making/ui/page/leave_page.dart';
import 'package:match_making/ui/page/main_page.dart';
import 'package:match_making/ui/page/report_page.dart';
import 'package:match_making/ui/page/self_certification_page.dart';
import 'package:match_making/ui/sign_up/sign_up_page.dart';

import 'file:///C:/Users/user/FlutterProjects/match_making/lib/ui/login_method/login_method_page.dart';

void main() {
  runApp(MatchMakingApp());
}

class MatchMakingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login/method',
      routes: {
        '/login/method': (_) => LoginMethodPage(),
        '/login/email': (_) => EmailLoginPage(),
        '/signup': (_) => SignUpPage(),
        '/signup/certification': (_) => SelfCertificationPage(),
        '/password/find': (_) => FindPasswordPage(),
        '/password/change': (_) => ChangePasswordPage(),
        '/main': (_) => MainPage(),
        '/report': (_) => ReportPage(),
        '/leave': (_) => LeavePage(),
        '/input/profile': (_) => InputProfilePage(),
        '/input/keyword': (_) => InputKeywordPage(),
        '/input/lol': (_) => InputLolPage()
      },
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF191919),
        ),
        scaffoldBackgroundColor: colorBackground,
        fontFamily: 'RIXGOB',
        hintColor: Colors.grey,
      ),
    );
  }
}