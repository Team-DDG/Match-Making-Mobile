import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/component/common_app_bar.dart';
import 'package:match_making/ui/styles.dart';

class InputKeywordPage extends StatefulWidget {
  @override
  _InputKeywordPageState createState() => _InputKeywordPageState();
}

class _InputKeywordPageState extends State<InputKeywordPage> {
  GlobalKey<AutoCompleteTextFieldState<User>> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          text: '정보 등록',
          actionWidgets: <Widget>[
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/input/lol');
                },
                child: Text(
                  '다음',
                  style: TextStyle(
                    color: colorLol,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(width: 24)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: padding48,
                child: _buildAutoCompleteTextField(),
              ),
              UserInfoWidget(),
              SizedBox(height: 12),
              RankInfoWidget(),
              SizedBox(height: 12),
              MostInfoWidget()
            ],
          ),
        ));
  }

  _buildAutoCompleteTextField() => AutoCompleteTextField<User>(
        key: key,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[600]),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: colorLol),
          ),
          hintText: '소환사 이름',
          hintStyle: TextStyle(color: Colors.grey[600]),
          contentPadding: EdgeInsets.only(left: 12),
        ),
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        suggestions: <User>[
          User('kimdohun', '10'),
          User('kimdohun0104', '10'),
          User('kimdohun010101', '10'),
        ],
        itemFilter: (item, query) =>
            item.name.toLowerCase().startsWith(query.toLowerCase()),
        itemSorter: (a, b) => a.name.compareTo(b.name),
        itemSubmitted: (item) {},
        itemBuilder: (context, item) => Container(
          padding: EdgeInsets.all(12),
          color: Colors.grey[900],
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/600x315/be/91/97/be9197d18d091abb4647cb115431fef9.jpg'),
                backgroundColor: Colors.transparent,
                radius: 20,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    item.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'RIXGOM',
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Lv. ' + item.level,
                    style: TextStyle(
                      color: colorWhiteTransparency[70],
                      fontFamily: 'RIXGOM',
                      fontSize: 10,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
}

class User {
  final String name;
  final String level;

  User(this.name, this.level);
}

class UserInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 48, right: 48),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/600x315/be/91/97/be9197d18d091abb4647cb115431fef9.jpg'),
            backgroundColor: Colors.transparent,
            radius: 43,
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '나디코아니다',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Lv. 2',
                    style: TextStyle(
                        fontSize: 12, color: colorWhiteTransparency[70]),
                  )
                ],
              ),
              SizedBox(height: 14),
              Text('major: Support',
                  style: TextStyle(
                      fontSize: 14, color: colorWhiteTransparency[70])),
              SizedBox(height: 4),
              Text('minor: Jungle',
                  style: TextStyle(
                      fontSize: 14, color: colorWhiteTransparency[70])),
            ],
          ),
        ],
      ),
    );
  }
}

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

class MostInfoWidget extends StatelessWidget {
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
              padding:
                  EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 24),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://i.pinimg.com/600x315/be/91/97/be9197d18d091abb4647cb115431fef9.jpg'),
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
                              '4.00:1',
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
                              '평점',
                              style: TextStyle(
                                fontSize: 14,
                                color: colorWhiteTransparency[70],
                              ),
                            ),
                            SizedBox(height: 8),
                            Row(
                              children: <Widget>[
                                Text(
                                  '100%',
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
                          '100게임',
                          style: TextStyle(
                            color: colorWhiteTransparency[70],
                            fontSize: 10,
                          ),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.end,
                    ),
                  );
                },
                itemCount: 3,
                shrinkWrap: true,
              ))
        ],
      ),
    );
  }
}
