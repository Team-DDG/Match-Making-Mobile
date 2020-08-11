import 'package:flutter/material.dart';
import 'package:match_making/data/response/lol_response.dart';

import '../../../colors.dart';

class MostInfoWidget extends StatelessWidget {
  final List<Most> mosts;

  MostInfoWidget({this.mosts});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '모스트',
            style: TextStyle(fontSize: 18, color: colorWhiteTransparency[70]),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 24),
            child: (mosts == null)
                ? Text(
                    '정보가 없습니다',
                    style: TextStyle(color: Colors.white),
                  )
                : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: _buildMostWidget(mosts[index]));
                    },
                    itemCount: mosts.length,
                    shrinkWrap: true,
                  ),
          )
        ],
      ),
    );
  }

  _buildMostWidget(Most most) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(most.image),
          radius: 28,
        ),
        SizedBox(width: 18),
        Column(
          children: <Widget>[
            Text(
              '평점',
              style: TextStyle(
                fontSize: 14,
                color: colorWhiteTransparency[70],
              ),
            ),
            SizedBox(height: 8),
            Text(
              most.evaluation,
              style: TextStyle(
                fontSize: 18,
                color: Colors.lightBlue[300],
              ),
            )
          ],
        ),
        SizedBox(width: 24),
        Column(
          children: <Widget>[
            Text(
              '승률',
              style: TextStyle(
                fontSize: 14,
                color: colorWhiteTransparency[70],
              ),
            ),
            SizedBox(height: 8),
            Row(
              children: <Widget>[
                Text(
                  most.winRate.toString(),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.red[400],
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(width: 10),
        Text(
          '${most.gameCount}게임',
          style: TextStyle(
            color: colorWhiteTransparency[70],
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
