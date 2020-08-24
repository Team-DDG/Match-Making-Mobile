import 'package:json_annotation/json_annotation.dart';

part 'keyword_response.g.dart';

@JsonSerializable()
class KeywordResponse {
  final int id;
  final String keyword;

  KeywordResponse({this.id, this.keyword});

  Map<String, dynamic> toJson() => _$KeywordResponseToJson(this);

  static KeywordResponse fromJson(Map<String, dynamic> json) =>
      _$KeywordResponseFromJson(json);
}
