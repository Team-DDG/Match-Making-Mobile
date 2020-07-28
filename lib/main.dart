import 'package:flutter/material.dart';
import 'package:match_making/data/service/keyword_service.dart';
import 'package:match_making/data/service/user_service.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/email_login/email_login_page.dart';
import 'package:match_making/ui/input/information/input_information_page.dart';
import 'package:match_making/ui/input/input_profile_model.dart';
import 'package:match_making/ui/input/keyword/input_keyword_page.dart';
import 'package:match_making/ui/login_method/login_method_page.dart';
import 'package:match_making/ui/page/change_password_page.dart';
import 'package:match_making/ui/page/find_password_page.dart';
import 'package:match_making/ui/page/input_lol_page.dart';
import 'package:match_making/ui/page/leave_page.dart';
import 'package:match_making/ui/page/main_page.dart';
import 'package:match_making/ui/page/report_page.dart';
import 'package:match_making/ui/page/self_certification_page.dart';
import 'package:match_making/ui/sign_up/sign_up_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MatchMakingApp());
}

class MatchMakingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => InputProfileModel(UserServiceImpl(), KeywordServiceImpl()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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
          '/input/information': (_) => InputInformationPage(),
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
      ),
    );
  }
}
