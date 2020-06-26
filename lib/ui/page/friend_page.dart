import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:match_making/ui/common/common_app_bar.dart';

class FriendPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(text: '친구'),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://vignette.wikia.nocookie.net/leagueoflegends/images/0/08/Purrrfect_profileicon.png/revision/latest?cb=20181009222256',
                    width: 56,
                    height: 56,
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      '나디코아니다',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                    Text(
                      'Silver3',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    //should i add sized box here?
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
            ),
            Divider(
              color: Colors.grey,
            ),
            Expanded(
              child: Center(
                child: Text(
                  "이런!\n아직 등록된 친구가 없습니다.\n\n매치 또는 메이킹을 통해\n새로운 친구를 만나러 가봐요!",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
        padding: EdgeInsets.all(24),
      ),
    );
  }
}
