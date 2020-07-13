import 'package:flutter/material.dart';
import 'package:match_making/ui/component/common_app_bar.dart';
import 'package:match_making/ui/component/common_ilist_tem.dart';

class MakingPage extends StatelessWidget {
  final List<String> names = <String>[
    '나디코아니다',
    '나씨코아니다',
    '나에이코아니다',
    '나이코아니다',
    '나에프코아니다',
    '나에프코아니다',
    '나에프코아니다',
    '나에프코아니다',
    '나에프코아니다'
  ];
  final List<String> ranks = <String>[
    'Silver3',
    'Gold1',
    'Challenger1',
    'Diamond5',
    'Iron',
    'Iron',
    'Iron',
    'Iron',
    'Iron'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(text: '메이킹'),
        body: Container(
          padding: EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    '매일 5명의 듀오를 만나보세요!',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '초기화',
                    style: TextStyle(color: Colors.lightBlue, fontSize: 14),
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: names.length,
                    itemBuilder: (context, index) {
                      return Container(
                          height: 56,
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: CommonListItem(
                            image: 'https://vignette.wikia.nocookie.net/leagueoflegends/images/0/08/Purrrfect_profileicon.png/revision/latest?cb=20181009222256',
                            name: names[index],
                            rank: ranks[index],
                          ));
                    }),
              )
            ],
          ),
        ));
  }
}
