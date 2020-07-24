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

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
        email: json['email'],
        gender: json['gender'],
        keywords: json['keywords'],
        playableEndTime: json['playableEndTime'],
        playableStartTime: json['playableStartTime']);
  }
}
