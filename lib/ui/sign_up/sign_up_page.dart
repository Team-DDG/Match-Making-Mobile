import 'package:flutter/material.dart';
import 'package:match_making/ui/component/common_app_bar.dart';
import 'package:match_making/ui/component/expanded_scroll_view.dart';
import 'package:match_making/ui/sign_up/component/sign_up_body.dart';
import 'package:match_making/ui/sign_up/sign_up_model.dart';
import 'package:provider/provider.dart';

import 'file:///C:/Users/user/FlutterProjects/match_making/lib/data/service/firebase_auth_service.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => SignUpModel(FirebaseAuthServiceImpl()),
        child: Scaffold(
          appBar: CommonAppBar(text: '회원가입'),
          body: ExpandedScrollView(child: SignUpBody()),
        ));
  }
}
