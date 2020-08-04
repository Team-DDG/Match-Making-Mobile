import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_making/data/error/handling_method_type.dart';
import 'package:match_making/data/response/lol_response.dart';
import 'package:match_making/extension/context_ext.dart';
import 'package:match_making/ui/component/progress_dialog.dart';
import 'package:match_making/ui/input/input_profile_model.dart';
import 'package:match_making/ui/input/lol/component/rank_info_widget.dart';
import 'package:match_making/ui/input/lol/component/user_info_widget.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';
import 'most_info_widget.dart';

class InputLolPage extends StatefulWidget {
  @override
  _InputLolPageState createState() => _InputLolPageState();
}

class _InputLolPageState extends State<InputLolPage> {
  TextEditingController _lolInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                        context
                            .read<InputProfileModel>()
                            .getLolBySummonerName({'summonerName': _lolInputController.value})
                            .then((value) => _updateInfo(value))
                            .catchError((e) => {
                                  if (e is Navigate)
                                    Navigator.pushReplacementNamed(
                                        context, e.route)
                                  else if (e is Message)
                                    context.showSnackbar(e.message)
                                })
                            .whenComplete(() => progressBar.hide());
                      },
                      icon: Icon(Icons.send),
                    )),
              ),
            ),
            UserInfoWidget(),
            SizedBox(height: 12),
            RankInfoWidget(),
            SizedBox(height: 12),
            MostInfoWidget()
          ],
        ),
      ),
    );
  }

  _updateInfo(LolResponse response) {}
}
