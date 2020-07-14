import 'package:flutter_test/flutter_test.dart';
import 'package:match_making/data/error/exception/internal_exception.dart';
import 'package:match_making/data/error/exception/not_found_exception.dart';
import 'package:match_making/data/error/exception/unauthorized_exception.dart';
import 'package:match_making/data/firebase_auth_service.dart';
import 'package:match_making/ui/email_login/email_login_model.dart';
import 'package:mockito/mockito.dart';

import '../mock/mock_firebase_auth_serivce.dart';

void main() {
  EmailLoginModel model;
  FirebaseAuthService firebaseAuthService;

  group('login', () {
    test('UserNotFound', () {
      firebaseAuthService = MockFirebaseAuthService();
      model = EmailLoginModel(firebaseAuthService);

      when(firebaseAuthService.signUp('dikolight203@gmail.com', 'password'))
          .thenThrow(NotFoundException());

      model
          .login('dikolight203@gmail.com', 'password')
          .catchError((err) => '등록된 계정이 없습니다');
    });

    test('WrongPassword', () {
      firebaseAuthService = MockFirebaseAuthService();
      model = EmailLoginModel(firebaseAuthService);

      when(firebaseAuthService.login('dikolight203@gmail.com', 'password'))
          .thenThrow(UnauthorizedException());

      model
          .login('dikolight203@gmail.com', 'password')
          .catchError((err) => '비밀번호가 일치하지 않습니다');
    });

    test('InternalServerError', () {
      firebaseAuthService = MockFirebaseAuthService();
      model = EmailLoginModel(firebaseAuthService);

      when(firebaseAuthService.login('dikolight203@gmail.com', 'password'))
          .thenThrow(InternalException());

      model
          .login('dikolight203@gmail.com', 'password')
          .catchError((err) => '서버에 문제가 발생했습니다');
    });

    test('Success', () {
      firebaseAuthService = MockFirebaseAuthService();
      model = EmailLoginModel(firebaseAuthService);

      when(firebaseAuthService.login('dikolight203@gmail.com', 'password'))
          .thenAnswer((_) => Future.value());

      model
          .login('dikolight203@gmail.com', 'password')
          .then((value) => expect(value, null));
    });
  });
}
