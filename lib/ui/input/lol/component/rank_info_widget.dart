import 'package:flutter/material.dart';
import 'package:match_making/data/response/lol_response.dart';
import 'package:match_making/ui/input/lol/component/tier_container.dart';

import '../../../colors.dart';

class RankInfoWidget extends StatelessWidget {
  final Rank flexRank;
  final Rank soloRank;

  RankInfoWidget({this.flexRank, this.soloRank});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '랭크',
            style: TextStyle(
              color: colorWhiteTransparency[70],
              fontSize: 18,
            ),
          ),
          SizedBox(height: 12),
          Padding(
              padding: EdgeInsets.only(left: 24, right: 24),
              child: Row(
                children: <Widget>[
                  _rankInfoWidgetBuilder('솔로 랭크', soloRank),
                  SizedBox(width: 24),
                  _rankInfoWidgetBuilder('자유 랭크', flexRank),
                ],
              ))
        ],
      ),
    );
  }

  _rankInfoWidgetBuilder(String rankType, Rank rank) {
    if (rank == null) {
      return Expanded(
        child: Text(
          '정보가 없습니다',
          style: TextStyle(color: Colors.white),
        ),
      );
    }
    return Expanded(
      child: TierContainer(
        rankKinds: rankType,
        rankAssetPath: rank.image,
        tier: rank.name,
      ),
    );
  }
}
