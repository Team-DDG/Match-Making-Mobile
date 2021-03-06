import 'package:match_making/data/error/handler/firebase_error_handler.dart';
import 'package:match_making/data/pref/pref_storage.dart';
import 'package:match_making/data/social/social_login_factory.dart';
import 'package:match_making/enum/social_type.dart';


abstract class SocialLoginService {
  Future<String> socialLogin(SocialType socialType);
}

class SocialLoginServiceImpl implements SocialLoginService {
  final PrefStorage _prefStorage;

  SocialLoginServiceImpl(this._prefStorage);

  @override
  Future<String> socialLogin(SocialType socialType) async {
    try {
      final token =
          await SocialLoginFactory.createSocialLogin(socialType).login();

      await _prefStorage.setAccessToken(token);
      return token;
    } catch (e) {
      FirebaseErrorHandler.throwProperException(e);
    }
    return null;
  }
}
