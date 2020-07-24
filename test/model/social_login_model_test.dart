import 'package:flutter_test/flutter_test.dart';
import 'package:match_making/data/error/exception/internal_exception.dart';
import 'package:match_making/data/error/exception/not_found_exception.dart';
import 'package:match_making/data/error/handling_method_type.dart';
import 'package:match_making/data/service/social_login_service.dart';
import 'package:match_making/data/service/user_service.dart';
import 'package:match_making/data/social/social_type.dart';
import 'package:match_making/ui/login_method/social_login_model.dart';
import 'package:mockito/mockito.dart';

import '../mock/mock_social_login_service.dart';
import '../mock/mock_user_service.dart';

void main() {
  SocialLoginService socialLoginService;
  UserService userService;
  SocialLoginModel model;

  group('socialLogin', () {
    setUpAll(() {
      socialLoginService = MockSocialLoginService();
      userService = MockUserService();
      model = SocialLoginModel(socialLoginService, userService);
    });

    test('InternalServerError', () {
      when(socialLoginService.socialLogin(SocialType.GOOGLE))
          .thenThrow(InternalException());

      model.socialLogin(SocialType.GOOGLE).catchError((err) => {
            expect(err, isInstanceOf<Message>()),
            expect((err as Message).message, '우효오오옷! 에러 겟또다제~ 초 럭키~★')
          });
    });

    test('NotFound_SummonerName', () {
      when(socialLoginService.socialLogin(SocialType.GOOGLE))
          .thenThrow(NotFoundException(message: 'summonerName is null'));

      model
          .socialLogin(SocialType.GOOGLE)
          .catchError((err) => expect((err as Route).route, '/input/lol'));
    });

    test('NotFound_Profile', () {
      when(socialLoginService.socialLogin(SocialType.GOOGLE))
          .thenThrow(NotFoundException());

      model.socialLogin(SocialType.GOOGLE).catchError(
          (err) => expect((err as Route).route, '/input/profile'));
    });

    test('Success', () {
      when(socialLoginService.socialLogin(SocialType.GOOGLE))
          .thenAnswer((realInvocation) => Future.value());

      model.socialLogin(SocialType.GOOGLE).then((value) => expect(value, null));
    });
  });
}
