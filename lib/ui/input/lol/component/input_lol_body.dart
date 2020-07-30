import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_making/data/response/summoner_response.dart';
import 'package:match_making/ui/input/lol/component/rank_info_widget.dart';
import 'package:match_making/ui/input/lol/component/summoner_name_auto_complete.dart';
import 'package:match_making/ui/input/lol/component/user_info_widget.dart';

import '../../../colors.dart';
import '../../../styles.dart';
import 'most_info_widget.dart';

class InputLolBody extends StatefulWidget {
  @override
  _InputLolBodyState createState() => _InputLolBodyState();
}

class _InputLolBodyState extends State<InputLolBody> {
  GlobalKey<AutoCompleteTextFieldState<SummonerResponse>> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: padding48,
              child: _buildAutoCompleteTextField(),
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

  _buildAutoCompleteTextField() => AutoCompleteTextField<SummonerResponse>(
        key: key,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[600]),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorLol),
          ),
          hintText: '소환사 이름',
          hintStyle: TextStyle(color: Colors.grey[600]),
          contentPadding: EdgeInsets.only(left: 12),
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        suggestions: <SummonerResponse>[
          SummonerResponse(),
          SummonerResponse(),
          SummonerResponse(),
        ],
        itemFilter: (item, query) =>
            item.summonerName.toLowerCase().startsWith(query.toLowerCase()),
        itemSorter: (a, b) => a.summonerName.compareTo(b.summonerName),
        itemSubmitted: (item) {},
        itemBuilder: (context, item) => SummonerNameAutoComplete(item: item),
      );
}
