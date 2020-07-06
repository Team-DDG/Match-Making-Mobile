import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/page/change_password_page.dart';
import 'package:match_making/ui/page/email_login_page.dart';
import 'package:match_making/ui/page/find_password_page.dart';
import 'package:match_making/ui/page/input_information1_page.dart';
import 'package:match_making/ui/page/input_information2_page.dart';
import 'package:match_making/ui/page/input_information3_page.dart';
import 'package:match_making/ui/page/leave_service_page.dart';
import 'package:match_making/ui/page/login_method_page.dart';
import 'package:match_making/ui/page/main_page.dart';
import 'package:match_making/ui/page/report_page.dart';
import 'package:match_making/ui/page/self_certification_page.dart';
import 'package:match_making/ui/page/sign_up_page.dart';

void main() {
  runApp(MatchMakingApp());
}

class MatchMakingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/main',
      routes: {
        '/loginMethod': (_) => LoginMethodPage(),
        '/emailLogin': (_) => EmailLoginPage(),
        '/findPassword': (_) => FindPasswordPage(),
        '/signup': (_) => SignUpPage(),
        '/selfCertification': (_) => SelfCertificationPage(),
        '/main': (_) => MainPage(),
        '/changePassword': (_) => ChangePasswordPage(),
        '/reportPage': (_) => ReportPage(),
        '/leaveService': (_) => LeaveServicePage(),
        '/inputInformation1': (_) => InputInformation1Page(),
        '/inputInformation2': (_) => InputInformation2Page(),
        '/inputInformation3': (_) => InputInformation3Page(),
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
