// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return UserResponse(
    email: json['email'] as String,
    gender: json['gender'] as String,
    keywords: (json['keywords'] as List)?.map((e) => e as String)?.toList(),
    playableEndTime: json['playableEndTime'] as String,
    playableStartTime: json['playableStartTime'] as String,
  );
}

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'email': instance.email,
      'gender': instance.gender,
      'keywords': instance.keywords,
      'playableEndTime': instance.playableEndTime,
      'playableStartTime': instance.playableStartTime,
    };
