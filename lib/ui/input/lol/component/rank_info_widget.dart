import 'package:flutter/material.dart';
import 'package:match_making/ui/input/lol/component/tier_container.dart';

import '../../../colors.dart';

class RankInfoWidget extends StatelessWidget {
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
                  Expanded(
                    child: TierContainer(
                      rankKinds: '솔로 랭크',
                      rankAssetPath: 'assets/tiers/tier_silver.png',
                      tier: 'Silver 3',
                    ),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                      child: TierContainer(
                    rankKinds: '자유 랭크',
                    rankAssetPath: 'assets/tiers/tier_challenger.png',
                    tier: 'Challenger',
                  ))
                ],
              ))
        ],
      ),
    );
  }
}
