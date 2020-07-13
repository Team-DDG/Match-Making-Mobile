abstract class PrefStorage {
  void setAccessToken(String accessToken);

  Future<String> getAccessToken();

  void deleteAccessToken();

  void setRefreshToken(String refreshToken);

  Future<String> getRefreshToken();

  void deleteRefreshToken();
}
