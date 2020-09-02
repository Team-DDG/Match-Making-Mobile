import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_making/extension/context_ext.dart';
import 'package:match_making/ui/component/common_button.dart';
import 'package:match_making/ui/component/common_text_field.dart';
import 'package:match_making/ui/self_certification/self_certification_model.dart';
import 'package:provider/provider.dart';

import '../styles.dart';

class SelfCertificationBody extends StatefulWidget {
  @override
  _SelfCertificationBodyState createState() => _SelfCertificationBodyState();
}

class _SelfCertificationBodyState extends State<SelfCertificationBody> {
  bool _isSent = false;

  final _phoneNumberController = TextEditingController();
  final _authCodeController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _authCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding48,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: CommonTextField(
                  hintText: '010-XXXX-XXXX',
                  controller: _phoneNumberController,
                ),
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
            crossFadeState:
                _isSent ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: Duration(milliseconds: 500),
          ),
          Expanded(child: Container()),
          CommonButton(
            text: '인증',
            onPressed: () {
              _onClickCertificate();
            },
          ),
        ],
      ),
    );
  }

  _onClickCertificate() {
    context
        .read<SelfCertificationModel>()
        .verifyPhone(_phoneNumberController.text, _authCodeController.text)
        .then((value) =>
            Navigator.pushReplacementNamed(context, '/input/information'))
        .catchError((e) => {context.showSnackbar(e)});
  }
}
