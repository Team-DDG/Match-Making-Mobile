import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../colors.dart';

class TierContainer extends StatelessWidget {
  final String rankKinds;
  final String rankAssetPath;
  final String tier;

  TierContainer({this.rankKinds, this.rankAssetPath, this.tier});

  @override
  Widget build(BuildContext context) {
    return Container(
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
}
