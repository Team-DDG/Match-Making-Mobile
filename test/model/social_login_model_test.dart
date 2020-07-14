import 'package:flutter_test/flutter_test.dart';
import 'package:match_making/data/error/exception/internal_exception.dart';
import 'package:match_making/data/social/social_type.dart';
import 'package:match_making/data/social_login_service.dart';
import 'package:match_making/ui/login_method/social_login_model.dart';
import 'package:mockito/mockito.dart';

import '../mock/mock_social_login_service.dart';

void main() {
  SocialLoginService socialLoginService;
  SocialLoginModel model;

  group('socialLogin', () {
    test('InternalServerError', () {
      socialLoginService = MockSocialLoginService();
      model = SocialLoginModel(socialLoginService);

      when(socialLoginService.socialLogin(SocialType.GOOGLE))
          .thenThrow(InternalException());

      model
          .socialLogin(SocialType.GOOGLE)
          .catchError((err) => expect(err, '우효오오옷! 에러 겟또다제~ 초 럭키~★'));
    });

    test('Success', () {
      socialLoginService = MockSocialLoginService();
      model = SocialLoginModel(socialLoginService);

      when(socialLoginService.socialLogin(SocialType.GOOGLE))
          .thenAnswer((realInvocation) => Future.value());

      model.socialLogin(SocialType.GOOGLE)
          .then((value) => expect(value, null));
    });
  });
}
