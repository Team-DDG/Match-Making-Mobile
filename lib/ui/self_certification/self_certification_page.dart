import 'package:flutter/material.dart';
import 'package:match_making/data/service/phone_auth_service.dart';
import 'package:match_making/ui/component/common_app_bar.dart';
import 'package:match_making/ui/self_certification/self_certification_body.dart';
import 'package:match_making/ui/self_certification/self_certification_model.dart';
import 'package:provider/provider.dart';

class SelfCertificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SelfCertificationModel(PhoneAuthServiceImpl()),
      child: Scaffold(
        appBar: CommonAppBar(text: '본인 인증'),
        body: SelfCertificationBody(),
      ),
    );
  }
}
