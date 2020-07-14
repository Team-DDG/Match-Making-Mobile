import 'package:match_making/data/social/social_login.dart';
import 'package:match_making/data/social/social_type.dart';

class SocialLoginFactory {
  static SocialLogin createSocialLogin(SocialType socialType) {
    switch (socialType) {
      case SocialType.GOOGLE:
        return GoogleSocialLogin();
      case SocialType.FACEBOOK:
        return FacebookSocialLogin();
      case SocialType.TWITTER:
        return TwitterSocialLogin();
      default:
        throw Exception('Social type not found!');
    }
  }
}
