import 'package:flutter/material.dart';
import 'package:match_making/ui/page/friend_page.dart';
import 'package:match_making/ui/page/making_page.dart';
import 'package:match_making/ui/page/matching_page.dart';
import 'package:match_making/ui/page/setting_page.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final _pages = <Widget>[
    FriendPage(),
    MatchingPage(),
    MakingPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('친구')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset),
              title: Text('매칭')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('매이킹')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              title: Text('설정')
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}