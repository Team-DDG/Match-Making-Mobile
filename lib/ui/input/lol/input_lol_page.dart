import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:match_making/data/error/handling_method_type.dart';
import 'package:match_making/extension/context_ext.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/component/common_app_bar.dart';
import 'package:match_making/ui/input/input_profile_model.dart';
import 'package:match_making/ui/input/lol/component/input_lol_body.dart';
import 'package:provider/provider.dart';

class InputLolPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = context.watch<InputProfileModel>();
    return Scaffold(
        appBar: CommonAppBar(
          text: '정보 등록',
          actionWidgets: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () => _onClickSendInfo(context, model),
                child: Text(
                  '다음',
                  style: TextStyle(
                    color: colorLol,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(width: 24)
          ],
        ),
        body: InputLolBody());
  }

  _onClickSendInfo(BuildContext context, InputProfileModel model) {
    model
        .postLolBySummonerName()
        .then((value) => Navigator.pushNamed(context, '/main'))
        .catchError((e) => {
              if (e is Navigate)
                Navigator.pushNamed(context, e.route)
              else if (e is Message)
                context.showSnackbar(e.message)
            });
  }
}
