import 'package:flutter/material.dart';
import 'package:match_making/data/firebase_auth_service.dart';
import 'package:match_making/ui/component/common_app_bar.dart';
import 'package:match_making/ui/component/expanded_scroll_view.dart';
import 'package:match_making/ui/email_login/component/email_login_body.dart';
import 'package:match_making/ui/email_login/email_login_model.dart';
import 'package:provider/provider.dart';

class EmailLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EmailLoginModel(FirebaseAuthServiceImpl()),
      child: Scaffold(
        appBar: CommonAppBar(text: '로그인'),
        body: ExpandedScrollView(
          child: EmailLoginBody(),
        ),
      ),
    );
  }
}
