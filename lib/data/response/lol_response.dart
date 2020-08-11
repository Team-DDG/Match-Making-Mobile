class LolResponse {
  String evaluation;
  FlexRank flexRank;
  String icon;
  dynamic level;
  List<Mosts> mosts;
  FlexRank soloRank;
  String summonerName;

  LolResponse(
      {this.evaluation,
        this.flexRank,
        this.icon,
        this.level,
        this.mosts,
        this.soloRank,
        this.summonerName});

  LolResponse.fromJson(Map<String, dynamic> json) {
    evaluation = json['evaluation'];
    flexRank = json['flexRank'] != null
        ? new FlexRank.fromJson(json['flexRank'])
        : null;
    icon = json['icon'];
    level = json['level'];
    if (json['mosts'] != null) {
      mosts = new List<Mosts>();
      json['mosts'].forEach((v) {
        mosts.add(new Mosts.fromJson(v));
      });
    }
    soloRank = json['soloRank'] != null
        ? new FlexRank.fromJson(json['soloRank'])
        : null;
    summonerName = json['summonerName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['evaluation'] = this.evaluation;
    if (this.flexRank != null) {
      data['flexRank'] = this.flexRank.toJson();
    }
    data['icon'] = this.icon;
    data['level'] = this.level;
    if (this.mosts != null) {
      data['mosts'] = this.mosts.map((v) => v.toJson()).toList();
    }
    if (this.soloRank != null) {
      data['soloRank'] = this.soloRank.toJson();
    }
    data['summonerName'] = this.summonerName;
    return data;
  }
}

class FlexRank {
  String image;
  String name;

  FlexRank({this.image, this.name});

  FlexRank.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['name'] = this.name;
    return data;
  }
}

class Mosts {
  String evaluation;
  dynamic gameCount;
  String image;
  String name;
  int winRate;

  Mosts({this.evaluation, this.gameCount, this.image, this.name, this.winRate});

  Mosts.fromJson(Map<String, dynamic> json) {
    evaluation = json['evaluation'];
    gameCount = json['gameCount'];
    image = json['image'];
    name = json['name'];
    winRate = json['winRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['evaluation'] = this.evaluation;
    data['gameCount'] = this.gameCount;
    data['image'] = this.image;
    data['name'] = this.name;
    data['winRate'] = this.winRate;
    return data;
  }
}