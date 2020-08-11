import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/component/common_app_bar.dart';
import 'package:match_making/ui/input/input_profile_model.dart';
import 'package:match_making/ui/input/lol/component/input_lol_body.dart';
import 'package:provider/provider.dart';

class InputLolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<InputProfileModel>();
    return Scaffold(appBar: CommonAppBar(
      text: '정보 등록',
      actionWidgets: <Widget>[
        Center(
          child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/input/lol');
              },
              child: GestureDetector(
                onTap: () {

                },
                  child: Text(
                    '다음',
                    style: TextStyle(
                      color: colorLol,
                      fontSize: 18,
                    ),
                  ), ,
              )
          ),
        ),
        SizedBox(width: 24)
      ],
    ),
        body: InputLolBody());
  }
}
