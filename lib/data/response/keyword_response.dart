class KeywordResponse {
  final int id;
  final String keyword;

  KeywordResponse({this.id, this.keyword});

  factory KeywordResponse.fromJson(Map<String, dynamic> json) {
    return KeywordResponse(
      id: json['id'],
      keyword: json['keyword']
    );
  }
}