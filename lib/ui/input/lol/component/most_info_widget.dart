import 'package:flutter/material.dart';

import '../../../colors.dart';

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