import 'package:flutter/material.dart';

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
                    child: _buildTierContainer(
                        '솔로 랭크', 'assets/tiers/tier_silver.png', 'Silver 3'),
                  ),
                  SizedBox(width: 24),
                  Expanded(
                    child: _buildTierContainer('자유 랭크',
                        'assets/tiers/tier_challenger.png', 'Chanllenger'),
                  )
                ],
              ))
        ],
      ),
    );
  }

  _buildTierContainer(String rankKinds, String rankAssetPath, String tier) =>
      Container(
        padding: EdgeInsets.only(top: 12, left: 32, right: 32, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[900],
        ),
        child: Column(
          children: <Widget>[
            Text(
              rankKinds,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Image.asset(
              rankAssetPath,
              width: 56,
              height: 56,
            ),
            SizedBox(height: 4),
            Text(
              tier,
              style: TextStyle(
                color: colorWhiteTransparency[70],
                fontSize: 8,
              ),
            )
          ],
        ),
      );
}