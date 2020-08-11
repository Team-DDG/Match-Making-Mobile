import 'package:flutter/material.dart';

import '../../../colors.dart';

class UserInfoWidget extends StatelessWidget {
  final String icon;
  final String name;
  final int level;

  UserInfoWidget({this.icon, this.name, this.level});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 48, right: 48),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(icon),
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
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 12),
                  Text(
                    'Lv. $level',
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
