class LolResponse {
  String evaluation;
  Rank flexRank;
  String icon;
  dynamic level;
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

  LolResponse.fromJson(Map<String, dynamic> json) {
    evaluation = json['evaluation'];
    flexRank = json['flexRank'] != null
        ? new Rank.fromJson(json['flexRank'])
        : null;
    icon = json['icon'];
    level = json['level'];
    if (json['mosts'] != null) {
      mosts = new List<Most>();
      json['mosts'].forEach((v) {
        mosts.add(new Most.fromJson(v));
      });
    }
    soloRank = json['soloRank'] != null
        ? new Rank.fromJson(json['soloRank'])
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

class Rank {
  String image;
  String name;

  Rank({this.image, this.name});

  Rank.fromJson(Map<String, dynamic> json) {
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

class Most {
  String evaluation;
  dynamic gameCount;
  String image;
  String name;
  int winRate;

  Most({this.evaluation, this.gameCount, this.image, this.name, this.winRate});

  Most.fromJson(Map<String, dynamic> json) {
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