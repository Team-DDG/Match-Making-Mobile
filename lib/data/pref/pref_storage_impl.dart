import 'package:match_making/data/pref/pref_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefStorageImpl implements PrefStorage {
  static const _PREF_NAME = "PREF_USER";
  static const _PREF_ACCESS_TOKEN = "PREF_ACCESS_TOKEN";
  static const _PREF_REFRESH_TOKEN = "PREF_REFRESH_TOKEN";

  @override
  void deleteAccessToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(_PREF_ACCESS_TOKEN);
  }

  @override
  void deleteRefreshToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove(_PREF_REFRESH_TOKEN);
  }

  @override
  Future<String> getAccessToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(_PREF_ACCESS_TOKEN);
  }

  @override
  Future<String> getRefreshToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(_PREF_REFRESH_TOKEN);
  }

  @override
  void setAccessToken(String accessToken) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(_PREF_ACCESS_TOKEN, accessToken);
  }

  @override
  void setRefreshToken(String accessToken) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString(_PREF_REFRESH_TOKEN, accessToken);
  }
}
