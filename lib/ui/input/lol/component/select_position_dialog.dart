import 'package:flutter/material.dart';

class SelectPositionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.grey[900],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        content: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/positions/position_mid.png'),
                  SizedBox(height: 28),
                  DropdownButton(
                    dropdownColor: Color(0xFF0D0D0D),
                    items: <String>['탑', '정글', '미드', '원딜', '서포터']
                        .map((value) => DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style:
                        TextStyle(color: Colors.white),
                      ),
                    ))
                        .toList(),
                    onChanged: (String value) {},
                    value: '탑',
                  )
                ],
              ),
            ),
            Positioned(
              child: Image.asset('assets/icons/ic_x.png'),
              right: 0,
              top: 0,
            )
          ],
        ));
  }
}
