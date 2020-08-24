import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_making/data/error/handling_method_type.dart';
import 'package:match_making/data/response/lol_response.dart';
import 'package:match_making/extension/context_ext.dart';
import 'package:match_making/ui/input/input_profile_model.dart';
import 'package:match_making/ui/input/lol/component/rank_info_widget.dart';
import 'package:match_making/ui/input/lol/component/user_info_widget.dart';
import 'package:provider/provider.dart';

import '../../../styles.dart';
import 'most_info_widget.dart';

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
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: '소환사명을 입력하세요',
                    suffixIcon: IconButton(
                      onPressed: _onClickSearchSummoner(context, model),
                      icon: Icon(Icons.send),
                    )),
              ),
            ),
            _buildLolInfo(model.lolResponse),
          ],
        ),
      ),
    );
  }

  _buildLolInfo(LolResponse response) {
    if (response != null) {
      return Column(
        children: <Widget>[
          UserInfoWidget(
            icon: response.icon,
            name: response.summonerName,
            level: response.level,
          ),
          SizedBox(height: 12),
          RankInfoWidget(
            flexRank: response.flexRank,
            soloRank: response.soloRank,
          ),
          SizedBox(height: 12),
          MostInfoWidget(
            mosts: response.mosts,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  _onClickSearchSummoner(BuildContext context, InputProfileModel model) async {
    final progressBar = await context.showAndGetProgressDialog('조회중입니다...');
    model
        .getLolBySummonerName()
        .catchError((e) => {
              if (e is Navigate)
                Navigator.pushReplacementNamed(context, e.route)
              else if (e is Message)
                context.showSnackbar(e.message)
            })
        .whenComplete(() => progressBar.hide());
  }
}
