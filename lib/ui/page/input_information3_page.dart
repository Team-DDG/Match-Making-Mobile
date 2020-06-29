import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/common/common_app_bar.dart';
import 'package:match_making/ui/styles.dart';

class InputInformation3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        text: '정보 등록',
        actionWidgets: <Widget>[
          Center(
            child: Text(
              '완료',
              style: TextStyle(
                fontSize: 18,
                color: colorLol,
              ),
            ),
          ),
          SizedBox(width: 24),
        ],
      ),
      body: Container(
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
                _buildChip(),
                _buildChip(),
                _buildChip(),
                _buildChip(),
                _buildChip(),
                _buildChip(),
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildChip() => Container(
        padding: EdgeInsets.only(right: 12),
        child: FilterChip(
          label: Text(
            '로밍',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          selected: false,
          selectedColor: Colors.grey[900],
          onSelected: (selected) {},
          backgroundColor: Colors.grey[800],
        ),
      );
}
