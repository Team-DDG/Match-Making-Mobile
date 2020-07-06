import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_making/ui/common/common_app_bar.dart';
import 'package:match_making/ui/common/common_button.dart';

import '../colors.dart';

class ReportPage extends StatelessWidget {
  String _selectedCategory;
  List<String> _categoryItems = [
    'sample1',
    'sample2',
    'sample3',
    'sample4',
    'sample5'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: '리포트'),
      body: Container(
        padding: EdgeInsets.only(left: 48, right: 48, top: 24, bottom: 48),
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(left: 12),
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: colorLol),
                    borderRadius: BorderRadius.circular(4)),
                child: DropdownButton(
                  underline: Container(),
                  hint: Text('주제를 선택해주세요'),
                  value: _selectedCategory,
                  onChanged: (newValue) {
                    _selectedCategory = newValue;
                  },
                  items: _categoryItems.map((item) {
                    return DropdownMenuItem(
                      child: Text(
                        item,
                        style: TextStyle(color: Colors.white),
                      ),
                      value: item,
                    );
                  }).toList(),
                )),
            SizedBox(
              height: 24,
            ),
            Container(
                height: 220,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: colorGray[600])),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorLol),
                    ),
                    hintText: '내용',
                    hintStyle:
                        TextStyle(fontFamily: 'RIXGOB', color: colorGray[600]),
                    contentPadding: EdgeInsets.all(12),
                  ),
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                )),
            Expanded(
              child: Container(),
            ),
            CommonButton(
              text: '리포트',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
