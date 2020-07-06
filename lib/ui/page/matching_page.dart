import 'package:flutter/material.dart';
import 'package:match_making/ui/common/common_app_bar.dart';
import 'package:match_making/ui/common/common_button.dart';

class MatchingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: '매칭'),
      body: Center(
        child: Column(
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(
              height: 30,
            ),
            Text(
              '예상 대기시간 60초',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Text(
              '???초 경과',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            SizedBox(
              height: 30,
            ),
            CommonButton(
              text: 'STOP!',
              onPressed: () {  },
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
