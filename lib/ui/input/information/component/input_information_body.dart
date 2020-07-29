import 'package:flutter/material.dart';
import 'package:match_making/enum/gender.dart';
import 'package:match_making/extension/context_ext.dart';
import 'package:match_making/ui/component/common_button.dart';
import 'package:match_making/ui/component/common_text_field.dart';
import 'package:match_making/ui/input/information/component/input_column_widget.dart';
import 'package:match_making/ui/input/input_profile_model.dart';
import 'package:match_making/ui/styles.dart';
import 'package:provider/provider.dart';

import '../../input_profile_model.dart';

class InputInformationBody extends StatefulWidget {
  @override
  _InputInformationBodyState createState() => _InputInformationBodyState();
}

class _InputInformationBodyState extends State<InputInformationBody> {
  @override
  void initState() {
    context.read<InputProfileModel>().getEmail();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputProfileModel = context.watch<InputProfileModel>();

    return Container(
      padding: padding48,
      child: Column(
        children: <Widget>[
          CommonTextField(
            hintText: '이메일',
            controller: TextEditingController(text: inputProfileModel.email),
          ),
          SizedBox(height: 24),
          InputColumnWidget(
            title: '성별',
            value: inputProfileModel.gender == Gender.MALE ? '남성' : '여성',
            updateText: '전환',
            onClickUpdate: () {
              inputProfileModel.switchGender();
            },
          ),
          SizedBox(height: 24),
          InputColumnWidget(
            title: '플레이 가능 시간',
            value:
                '${inputProfileModel.playableStartTime}~${inputProfileModel.playableEndTime}',
            onClickUpdate: () async {
              final start = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              final end = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );

              try {
                inputProfileModel.setPlayableTime(
                    '${start.hour}:${start.minute}',
                    '${end.hour}:${end.minute}');
              } catch (e) {
                context.showSnackbar('시작 시간이 더 빠릅니다');
              }
            },
          ),
          Expanded(child: Container()),
          CommonButton(
            text: '다음으로',
            onPressed: () {
              Navigator.pushNamed(context, '/input/keyword');
            },
          )
        ],
      ),
    );
  }
}
