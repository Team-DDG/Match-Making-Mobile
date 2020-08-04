import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_making/data/error/handling_method_type.dart';
import 'package:match_making/data/response/lol_response.dart';
import 'package:match_making/extension/context_ext.dart';
import 'package:match_making/ui/component/progress_dialog.dart';
import 'package:match_making/ui/input/input_profile_model.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';

class InputLolBody extends StatefulWidget {
  @override
  _InputLolBodyState createState() => _InputLolBodyState();
}

class _InputLolBodyState extends State<InputLolBody> {
  TextEditingController _lolInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final model = context.watch<InputProfileModel>();
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: padding48,
              child: TextField(
                controller: _lolInputController,
                decoration: InputDecoration(
                    hintText: '소환사명을 입력하세요',
                    suffixIcon: IconButton(
                      onPressed: () async {
                        final progressBar =
                            getProgressDialog(context, '조회중입니다...');
                        await progressBar.show();
                        model
                            .getLolBySummonerName({'summonerName': _lolInputController.value})
                            .then((value) => {})
                            .catchError((e) => {
                                  if (e is Navigate)
                                    Navigator.pushReplacementNamed(context, e.route)
                                  else if (e is Message)
                                    context.showSnackbar(e.message)
                                })
                            .whenComplete(() => progressBar.hide());
                      },
                      icon: Icon(Icons.send),
                    )),
              ),
            ),

          ],
        ),
      ),
    );
  }

  _updateInfo(LolResponse response) {

  }
}
