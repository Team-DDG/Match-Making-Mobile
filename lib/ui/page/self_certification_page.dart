import 'package:flutter/material.dart';
import 'package:match_making/ui/component/common_app_bar.dart';
import 'package:match_making/ui/component/common_button.dart';
import 'package:match_making/ui/component/common_text_field.dart';
import 'package:match_making/ui/styles.dart';

class SelfCertificationPage extends StatefulWidget {
  @override
  _SelfCertificationPageState createState() => _SelfCertificationPageState();
}

class _SelfCertificationPageState extends State<SelfCertificationPage> {
  bool _isSent = false;
  String _authCode;

  final _authCodeController = TextEditingController();

  @override
  void dispose() {
    _authCodeController.dispose();
    super.dispose();
  }

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
                  child: CommonTextField(hintText: '010-XXXX-XXXX'),
                  flex: 1,
                ),
                SizedBox(width: 14),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isSent = true;
                    });
                  },
                  child: Text(
                    '발송',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            AnimatedCrossFade(
              firstChild: Container(),
              secondChild: CommonTextField(
                hintText: '인증 번호',
                controller: _authCodeController,
              ),
              crossFadeState: _isSent
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 500),
            ),
            Expanded(child: Container()),
            CommonButton(
              text: '인증',
              onPressed: () {
                if (_authCode == _authCodeController.text) {
                  Navigator.pushReplacementNamed(context, '/inputInformation1');
                } else {}
              },
            ),
          ],
        ),
      ),
    );
  }
}
