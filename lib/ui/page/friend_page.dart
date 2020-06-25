import 'package:flutter/material.dart';
import 'package:match_making/ui/common/common_app_bar.dart';

class FriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: '친구'),
      body: Center(
        child: Text('도모다찌'),
      ),
    );
  }
}
