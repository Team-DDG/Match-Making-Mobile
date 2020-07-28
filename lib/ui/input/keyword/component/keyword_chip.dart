import 'package:flutter/material.dart';
import 'package:match_making/data/response/keyword_response.dart';

class KeywordChip extends StatelessWidget {
  final KeywordResponse keyword;
  final bool isSelected;
  final ValueChanged<bool> onSelected;

  const KeywordChip(
      {Key key,
      @required this.keyword,
      this.isSelected: false,
      this.onSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 12),
      child: FilterChip(
        label: Text(
          keyword.keyword,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        selected: isSelected,
        selectedColor: Colors.grey[900],
        onSelected: onSelected,
        backgroundColor: Colors.grey[800],
      ),
    );
  }
}
