import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/screen/email_login_page.dart';
import 'package:match_making/ui/screen/find_password_page.dart';
import 'package:match_making/ui/screen/login_method_page.dart';

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
