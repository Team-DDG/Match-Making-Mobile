import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_making/data/response/summoner_response.dart';

import '../../../colors.dart';

class SummonerNameAutoComplete extends StatelessWidget {
  final SummonerResponse item;

  SummonerNameAutoComplete({this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }

}