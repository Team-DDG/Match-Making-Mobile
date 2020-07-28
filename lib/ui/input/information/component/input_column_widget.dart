import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';

class InputColumnWidget extends StatelessWidget {
  InputColumnWidget(
      {this.title, this.value, this.onClickUpdate, this.updateText: '수정'});

  final String title;
  final String value;
  final String updateText;
  final VoidCallback onClickUpdate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: colorWhiteTransparency[80],
            fontSize: 12,
          ),
        ),
        SizedBox(height: 4),
        Row(
          children: <Widget>[
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            Expanded(child: Container()),
            GestureDetector(
              onTap: () {
                onClickUpdate.call();
              },
              child: Text(
                updateText,
                style: TextStyle(fontSize: 16, color: colorLol),
              ),
            ),
          ],
        )
      ],
    );
  }
}
