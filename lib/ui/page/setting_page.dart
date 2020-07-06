import 'package:flutter/material.dart';
import 'package:match_making/ui/common/common_app_bar.dart';

class SettingPage extends StatelessWidget {
  bool isEventSelected = true;
  bool isMakingRequestSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(text: '설정'),
        body: Container(
          child: Column(children: <Widget>[
            Container(
              padding:
                  EdgeInsets.only(top: 12, left: 24, right: 24, bottom: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '알림',
                    style: TextStyle(
                      color: Colors.lightBlue[300],
                      fontSize: 12,
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 12),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '이벤트',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Expanded(child: Container()),
                          SizedBox(
                              height: 20,
                              child: Switch(
                                value: isEventSelected,
                                onChanged: (value) {},
                                activeColor: Colors.lightBlue,
                                activeTrackColor: Colors.lightBlue,
                              ))
                        ],
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 12),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '메이킹 신청',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Expanded(child: Container()),
                          SizedBox(
                              height: 20,
                              child: Switch(
                                value: isMakingRequestSelected,
                                onChanged: (value) {},
                                activeColor: Colors.lightBlue,
                                activeTrackColor: Colors.lightBlue,
                              ))
                        ],
                      )),
                ],
              ),
            ),
            Divider(
              height: 8,
              color: Colors.grey,
            ),
            Setting(headerText: '문의', settings: [
              SettingItem('리포트', () {}),
              SettingItem('리뷰 작성', () {}),
            ]),
            Divider(
              height: 8,
              color: Colors.grey,
            ),
            Column(children: <Widget>[
              Setting(headerText: '약관', settings: [
                SettingItem('이용약관', () {}),
                SettingItem('오픈소스 라이센스', () {}),
              ])
            ]),
            Divider(
              height: 8,
              color: Colors.grey,
            ),
            Setting(headerText: '계정', settings: [
              SettingItem('비밀번호 변경', () {}),
              SettingItem('로그아웃', () {}),
              SettingItem('회원 탈퇴', () {}),
            ])
          ]),
        ));
  }
}

class Setting extends StatelessWidget {
  final String headerText;
  final List<SettingItem> settings;

  const Setting({Key key, this.headerText, this.settings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 12, left: 24, right: 24, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            headerText,
            style: TextStyle(
              color: Colors.lightBlue[300],
              fontSize: 12,
            ),
          ),
          Column(
            children: settings
                .map<Widget>((e) => _buildSettingElement(e.setting, e.onClick))
                .toList(),
            //here have to be widget
          ),
        ],
      ),
    );
  }

  _buildSettingElement(String title, VoidCallback onClick) => GestureDetector(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.only(top: 12),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            Expanded(child: Container()),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            )
          ],
        ),
      ));
}

class SettingItem {
  final String setting;
  final VoidCallback onClick;

  SettingItem(this.setting, this.onClick);
}
