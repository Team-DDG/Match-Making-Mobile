// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lol_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LolResponse _$LolResponseFromJson(Map<String, dynamic> json) {
  return LolResponse(
    evaluation: json['evaluation'] as String,
    flexRank: json['flexRank'] == null
        ? null
        : Rank.fromJson(json['flexRank'] as Map<String, dynamic>),
    icon: json['icon'] as String,
    level: json['level'] as int,
    mosts: (json['mosts'] as List)
        ?.map(
            (e) => e == null ? null : Most.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    soloRank: json['soloRank'] == null
        ? null
        : Rank.fromJson(json['soloRank'] as Map<String, dynamic>),
    summonerName: json['summonerName'] as String,
  );
}

Map<String, dynamic> _$LolResponseToJson(LolResponse instance) =>
    <String, dynamic>{
      'evaluation': instance.evaluation,
      'flexRank': instance.flexRank,
      'icon': instance.icon,
      'level': instance.level,
      'mosts': instance.mosts,
      'soloRank': instance.soloRank,
      'summonerName': instance.summonerName,
    };

Rank _$RankFromJson(Map<String, dynamic> json) {
  return Rank(
    image: json['image'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$RankToJson(Rank instance) => <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
    };

Most _$MostFromJson(Map<String, dynamic> json) {
  return Most(
    evaluation: json['evaluation'] as String,
    gameCount: json['gameCount'] as int,
    image: json['image'] as String,
    name: json['name'] as String,
    winRate: json['winRate'] as int,
  );
}

Map<String, dynamic> _$MostToJson(Most instance) => <String, dynamic>{
      'evaluation': instance.evaluation,
      'gameCount': instance.gameCount,
      'image': instance.image,
      'name': instance.name,
      'winRate': instance.winRate,
    };
