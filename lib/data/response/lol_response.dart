import 'package:json_annotation/json_annotation.dart';

part 'lol_response.g.dart';

@JsonSerializable()
class LolResponse {
  String evaluation;
  Rank flexRank;
  String icon;
  int level;
  List<Most> mosts;
  Rank soloRank;
  String summonerName;

  LolResponse(
      {this.evaluation,
      this.flexRank,
      this.icon,
      this.level,
      this.mosts,
      this.soloRank,
      this.summonerName});

  Map<String, dynamic> toJson() => _$LolResponseToJson(this);

  static LolResponse fromJson(Map<String, dynamic> json) =>
      _$LolResponseFromJson(json);
}

@JsonSerializable()
class Rank {
  String image;
  String name;

  Rank({this.image, this.name});

  Map<String, dynamic> toJson() => _$RankToJson(this);

  static Rank fromJson(Map<String, dynamic> json) => _$RankFromJson(json);
}

@JsonSerializable()
class Most {
  String evaluation;
  int gameCount;
  String image;
  String name;
  int winRate;

  Most({this.evaluation, this.gameCount, this.image, this.name, this.winRate});

  Map<String, dynamic> toJson() => _$MostToJson(this);

  static Most fromJson(Map<String, dynamic> json) => _$MostFromJson(json);
}
