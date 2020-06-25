import 'package:flutter/material.dart';
import 'package:match_making/ui/common/common_app_bar.dart';

class MakingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: '메이킹'),
      body: Center(
        child: Text('메이킹'),
      ),
    );
  }

}