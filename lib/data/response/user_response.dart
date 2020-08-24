
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  final String email;
  final String gender;
  final List<String> keywords;
  final String playableEndTime;
  final String playableStartTime;

  UserResponse(
      {this.email,
      this.gender,
      this.keywords,
      this.playableEndTime,
      this.playableStartTime});

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  static UserResponse fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}
