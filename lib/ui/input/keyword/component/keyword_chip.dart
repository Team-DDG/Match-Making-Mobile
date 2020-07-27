import 'package:flutter/material.dart';

class KeywordChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 12),
      child: FilterChip(
        label: Text(
          '로밍',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        selected: false,
        selectedColor: Colors.grey[900],
        onSelected: (selected) {},
        backgroundColor: Colors.grey[800],
      ),
    );
  }
}
