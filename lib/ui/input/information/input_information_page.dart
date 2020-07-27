import 'package:flutter/material.dart';
import 'package:match_making/ui/component/common_app_bar.dart';
import 'package:match_making/ui/input/information/component/input_information_body.dart';

class InputInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: '정보 등록'),
      body: InputInformationBody(),
    );
  }
}
