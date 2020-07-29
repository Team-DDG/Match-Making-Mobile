import 'package:flutter/material.dart';

import '../../../colors.dart';

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