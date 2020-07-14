abstract class PrefStorage {
  Future deleteAccessToken();

  Future<String> getAccessToken();

  Future setAccessToken(String accessToken);
}
