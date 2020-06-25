import 'package:flutter/material.dart';
import 'package:match_making/ui/common/common_app_bar.dart';

class MatchingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: '매칭'),
      body: Center(
        child: Text('매칭'),
      ),
    );
  }

}