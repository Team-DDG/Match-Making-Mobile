import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/input/keyword/component/keyword_chip.dart';
import 'package:match_making/ui/styles.dart';

class InputKeywordBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding48,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '자신이 선호하는 키워드',
            style: TextStyle(
              color: colorWhiteTransparency[70],
              fontSize: 18,
            ),
          ),
          SizedBox(height: 24),
          Wrap(
            children: <Widget>[
              KeywordChip(),
              KeywordChip(),
              KeywordChip()
            ],
          )
        ],
      ),
    );
  }
}
