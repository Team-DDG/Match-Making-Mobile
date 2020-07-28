import 'package:flutter/material.dart';
import 'package:match_making/ui/colors.dart';
import 'package:match_making/ui/input/input_profile_model.dart';
import 'package:match_making/ui/input/keyword/component/keyword_chip.dart';
import 'package:match_making/ui/styles.dart';
import 'package:provider/provider.dart';

class InputKeywordBody extends StatefulWidget {
  @override
  _InputKeywordBodyState createState() => _InputKeywordBodyState();
}

class _InputKeywordBodyState extends State<InputKeywordBody> {
  @override
  void initState() {
    context.read<InputProfileModel>().getKeywords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final inputProfileModel = context.watch<InputProfileModel>();
    return Container(
      padding: padding48,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '자신이 선호하는 키워드',
            style: TextStyle(
              color: colorWhiteTransparency[70],
              fontSize: 18,
            ),
          ),
          SizedBox(height: 24),
          inputProfileModel.keywords == null
              ? _buildLoadingIndicator()
              : _buildKeywords(inputProfileModel)
        ],
      ),
    );
  }

  _buildLoadingIndicator() => Center(child: CircularProgressIndicator());

  _buildKeywords(InputProfileModel model) => Wrap(
      children: model.keywords
          .map((keyword) => KeywordChip(keyword: keyword))
          .toList());
}
