import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:match_making/ui/component/common_app_bar.dart';
import 'package:match_making/ui/component/common_button.dart';

class MatchingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final APP_ID = 'ca-app-pub-5565379258849542~8235036520';
    final add_id = 'ca-app-pub-5565379258849542/1669628174';
    //TODO failed with code 0. it seems i newly added new ads
    final test_id = 'ca-app-pub-3940256099942544/2247696110';
    return Scaffold(
      appBar: CommonAppBar(text: '매칭'),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              height: 60,
              child: NativeAdmob(
                adUnitID: test_id,
              ),
            ),
            Expanded(
              child: Container(),
            ),
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
            Expanded(
              child: Container(),
            ),
            CommonButton(
              text: 'STOP!',
              onPressed: () {},
            )
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
