import 'package:match_making/data/pref/pref_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefStorageImpl implements PrefStorage {
  static const _PREF_ACCESS_TOKEN = "PREF_ACCESS_TOKEN";

  @override
  Future deleteAccessToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(_PREF_ACCESS_TOKEN);
  }

  @override
  Future<String> getAccessToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString(_PREF_ACCESS_TOKEN);
  }

  @override
  Future setAccessToken(String accessToken) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString(_PREF_ACCESS_TOKEN, accessToken);
  }
}
