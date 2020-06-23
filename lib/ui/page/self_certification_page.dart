import 'package:flutter/material.dart';
import 'package:match_making/ui/common/common_app_bar.dart';
import 'package:match_making/ui/common/common_button.dart';
import 'package:match_making/ui/common/common_text_field.dart';
import 'package:match_making/ui/styles.dart';

class SelfCertificationPage extends StatefulWidget {
  @override
  _SelfCertificationPageState createState() => _SelfCertificationPageState();
}

class _SelfCertificationPageState extends State<SelfCertificationPage> {
  bool _isSended = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: '본인 인증'),
      body: Container(
        padding: padding48,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: CommonTextField(hint: '010-XXXX-XXXX'),
                  flex: 1,
                ),
                SizedBox(width: 14),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSended = true;
                    });
                  },
                  child: Text(
                    '발송',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'RIXGOB',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            AnimatedCrossFade(
              firstChild: Container(),
              secondChild: CommonTextField(hint: '인증 번호'),
              crossFadeState: _isSended
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 500),
            ),
            Expanded(child: Container()),
            CommonButton(text: '인증'),
          ],
        ),
      ),
    );
  }
}
