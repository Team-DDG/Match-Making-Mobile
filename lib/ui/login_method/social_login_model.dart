import 'package:match_making/data/social/social_type.dart';
import 'package:match_making/data/social_login_service.dart';
import 'package:match_making/provider/base_model.dart';

class SocialLoginModel extends BaseModel {
  final SocialLoginService _socialLoginService;

  SocialLoginModel(this._socialLoginService);

  Future socialLogin(SocialType type) async {
    try {
      await _socialLoginService.socialLogin(type);
    } catch (e) {
      return Future.error('우효오오옷! 에러 겟또다제~ 초 럭키~★');
    }
  }
}