import 'package:flutter/material.dart';
import 'package:match_making/data/error/handling_method_type.dart';
import 'package:match_making/extension/context_ext.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/component/common_app_bar.dart';
import 'package:match_making/ui/component/progress_dialog.dart';
import 'package:match_making/ui/input/input_profile_model.dart';
import 'package:match_making/ui/input/keyword/component/input_keywork_body.dart';
import 'package:provider/provider.dart';

class InputKeywordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        text: '정보 등록',
        actionWidgets: [
          GestureDetector(
            onTap: () async {
              final progressbar = getProgressDialog(context, '정보를 입력중입니다...');
              await progressbar.show();
              context
                  .read<InputProfileModel>()
                  .postUserProfile()
                  .then((value) => Navigator.pushNamed(context, '/input/lol'))
                  .catchError((e) => {
                        if (e is Navigate)
                          Navigator.pushReplacementNamed(context, e.route)
                        else if (e is Message)
                          context.showSnackbar(e.message)
                      })
                  .whenComplete(() => progressbar.hide());
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(right: 24),
              child: Text(
                '다음',
                style: TextStyle(color: colorLol, fontSize: 18),
              ),
            ),
          )
        ],
      ),
      body: InputKeywordBody(),
    );
  }
}
