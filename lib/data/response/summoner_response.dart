class SummonerResponse {
  final String summonerName;
  final int level;
  final String icon;
  final String majorPosition;
  final String minorPosition;
  final SoloRank soloRank;
  final FlexRank flexRank;
  final List<Most> mosts;
  final double evaluation;

  SummonerResponse(
      {this.summonerName,
      this.level,
      this.icon,
      this.majorPosition,
      this.minorPosition,
      this.soloRank,
      this.flexRank,
      this.mosts,
      this.evaluation});

  factory SummonerResponse.fromJson(Map<String, dynamic> json) {
    return SummonerResponse(
      summonerName: json['summonerName'],
      level: json['level'],
      icon: json['icon'],
      majorPosition: json['majorPosition'],
      minorPosition: json['minorPosition'],
      soloRank: SoloRank.fromJson(json['soloRank']),
      flexRank: FlexRank.fromJson(json['flexRank']),
      mosts: (json['mosts'] as List).map((e) => Most.fromJson(e)).toList(),
      evaluation: json['evaluation']
    );
  }
}

class SoloRank {
  final String name;
  final String image;

  SoloRank({this.name, this.image});

  factory SoloRank.fromJson(Map<String, dynamic> json) {
    return SoloRank(name: json['name'], image: json['image']);
  }
}

class FlexRank {
  final String name;
  final String image;

  FlexRank({this.name, this.image});

  factory FlexRank.fromJson(Map<String, dynamic> json) {
    return FlexRank(name: json['name'], image: json['image']);
  }
}

class Most {
  final String name;
  final String image;
  final String kda;
  final double winRate;
  final int gameCount;

  Most({this.name, this.image, this.kda, this.winRate, this.gameCount});

  factory Most.fromJson(Map<String, dynamic> json) {
    return Most(
        name: json['name'],
        image: json['image'],
        kda: json['kda'],
        winRate: json['winRate'],
        gameCount: json['gameCount']);
  }
}
