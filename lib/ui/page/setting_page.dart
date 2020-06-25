import 'package:flutter/material.dart';
import 'package:match_making/ui/common/common_app_bar.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: '설정'),
      body: Center(
        child: Text('설정'),
      ),
    );
  }

}