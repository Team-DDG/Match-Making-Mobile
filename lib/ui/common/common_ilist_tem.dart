import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonListItem extends StatelessWidget {
  CommonListItem({this.image, this.name, this.rank});

  final String image;
  final String name;
  final String rank;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            image,
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
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            Text(
              rank,
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            //should i add sized box here?
          ],
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
      ],
    );
  }
}
