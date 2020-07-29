import 'package:match_making/data/error/exception/not_found_exception.dart';
import 'package:match_making/data/error/handling_method_type.dart';
import 'package:match_making/data/service/social_login_service.dart';
import 'package:match_making/data/service/user_service.dart';
import 'package:match_making/provider/base_model.dart';

import 'file:///C:/Users/user/AndroidStudioProjects/Match-Making-Mobile/lib/enum/social_type.dart';

class SocialLoginModel extends BaseModel {
  final SocialLoginService _socialLoginService;
  final UserService _userService;

  SocialLoginModel(this._socialLoginService, this._userService);

  Future socialLogin(SocialType type) async {
    try {
      final token = await _socialLoginService.socialLogin(type);
      await _userService.getUser(token);
    } on NotFoundException catch (e) {
      if (e.message == 'summonerName is null')
        return Future.error(Navigate('/input/lol'));
      else
        return Future.error(Navigate('/input/information'));
    } catch (e) {
      return Future.error(Message('우효오오옷! 에러 겟또다제~ 초 럭키~★'));
    }
    return null;
  }
}
