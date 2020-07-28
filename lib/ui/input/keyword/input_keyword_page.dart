import 'package:flutter/material.dart';
import 'package:match_making/ui/component/common_app_bar.dart';
import 'package:match_making/ui/input/keyword/component/input_keywork_body.dart';

class InputKeywordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: '정보 등록'),
      body: InputKeywordBody(),
    );
  }
}
