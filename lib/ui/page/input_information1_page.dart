import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/component/common_app_bar.dart';
import 'package:match_making/ui/component/common_button.dart';
import 'package:match_making/ui/component/common_text_field.dart';
import 'package:match_making/ui/styles.dart';

class InputInformation1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: '정보 등록'),
      body: Container(
        padding: padding48,
        child: Column(
          children: <Widget>[
            CommonTextField(hint: '이름'),
            SizedBox(height: 24),
            InputWidget(
              title: '생년월일',
              value: '2003-01-04',
              onClickUpdate: () {
                showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.utc(1950, 1, 1),
                    lastDate: DateTime.utc(2030, 1, 1));
              },
            ),
            SizedBox(height: 24),
            InputWidget(
              title: '성별',
              value: '남성',
            ),
            SizedBox(height: 24),
            InputWidget(
              title: '플레이 가능 시간',
              value: '10:30~12:30',
              onClickUpdate: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
              },
            ),
            Expanded(child: Container()),
            CommonButton(
              text: '다음으로',
              onPressed: () {
                Navigator.pushNamed(context, '/inputInformation2');
              },
            )
          ],
        ),
      ),
    );
  }
}

class InputWidget extends StatelessWidget {
  InputWidget({this.title, this.value, this.onClickUpdate});

  final String title;
  final String value;
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
                '수정',
                style: TextStyle(
                    fontSize: 16, color: colorLol),
              ),
            ),
          ],
        )
      ],
    );
  }
}
