class LolResponse {
  final String evaluation;
  final FlexRank flexRank;
  final String icon;
  final int level;
  final List<Most> mosts;
  final SoloRank soloRank;

  LolResponse(
      {this.evaluation,
      this.flexRank,
      this.icon,
      this.level,
      this.mosts,
      this.soloRank});

  factory LolResponse.fromJson(Map<String, dynamic> json) {
    return LolResponse(
      evaluation: json['evaluation'],
      flexRank: FlexRank.fromJson(json['flexRank']),
      icon: json['icon'],
      level: json['level'],
      mosts: (json['mosts'] as List).map((e) => Most.fromJson(e)).toList(),
      soloRank: SoloRank.fromJson(json['soloRank'])
    );
  }
}

class FlexRank {
  final String image;
  final String name;

  FlexRank({this.image, this.name});

  factory FlexRank.fromJson(Map<String, dynamic> json) {
    return FlexRank(image: json['image'], name: json['name']);
  }
}

class Most {
  final String evaluation;
  final int gameCount;
  final String image;
  final String name;
  final double winRate;

  Most({this.evaluation, this.gameCount, this.image, this.name, this.winRate});

  factory Most.fromJson(Map<String, dynamic> json) {
    return Most(
        evaluation: json['evaluation'],
        gameCount: json['gameCount'],
        image: json['image'],
        name: json['name'],
        winRate: json['winRate']);
  }
}

class SoloRank {
  final String image;
  final String name;

  SoloRank({this.image, this.name});

  factory SoloRank.fromJson(Map<String, dynamic> json) {
    return SoloRank(image: json['image'], name: json['name']);
  }
}
