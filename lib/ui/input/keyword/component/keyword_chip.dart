import 'package:flutter/material.dart';
import 'package:match_making/data/response/keyword_response.dart';
import 'package:match_making/ui/input/input_profile_model.dart';
import 'package:provider/provider.dart';

class KeywordChip extends StatelessWidget {
  final KeywordResponse keyword;

  const KeywordChip({Key key, @required this.keyword}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = context.watch<InputProfileModel>();
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
        selected: model.selectedKeywords.contains(keyword.id),
        selectedColor: Colors.grey[900],
        onSelected: (value) => model.setSelectedKeyword(keyword.id, value),
        backgroundColor: Colors.grey[800],
      ),
    );
  }
}
