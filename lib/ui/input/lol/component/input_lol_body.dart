import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_making/data/response/summoner_response.dart';
import 'package:match_making/ui/input/lol/component/rank_info_widget.dart';
import 'package:match_making/ui/input/lol/component/user_info_widget.dart';

import '../../../colors.dart';
import '../../../styles.dart';
import 'most_info_widget.dart';

class InputLolPage extends StatefulWidget {
  @override
  _InputLolPageState createState() => _InputLolPageState();
}

class _InputLolPageState extends State<InputLolPage> {
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
    itemBuilder: (context, item) => Container(
      padding: EdgeInsets.all(12),
      color: Colors.grey[900],
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/600x315/be/91/97/be9197d18d091abb4647cb115431fef9.jpg'),
            backgroundColor: Colors.transparent,
            radius: 20,
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.summonerName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'RIXGOM',
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Lv. ' + item.level.toString(),
                style: TextStyle(
                  color: colorWhiteTransparency[70],
                  fontFamily: 'RIXGOM',
                  fontSize: 10,
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
