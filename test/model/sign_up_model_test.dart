import 'package:flutter_test/flutter_test.dart';
import 'package:match_making/data/error/exception/conflict_exception.dart';
import 'package:match_making/data/error/exception/internal_exception.dart';
import 'package:match_making/data/error/handling_method_type.dart';
import 'package:match_making/data/service/firebase_auth_service.dart';
import 'package:match_making/ui/sign_up/sign_up_model.dart';
import 'package:mockito/mockito.dart';

import '../mock/mock_firebase_auth_serivce.dart';

void main() {
  SignUpModel model;
  FirebaseAuthService firebaseAuthService;

  setUp(() {
    firebaseAuthService = MockFirebaseAuthService();
    model = SignUpModel(firebaseAuthService);
  });

  group('signUp', () {
    test('InvalidEmailFormat', () {
      model
          .signUp('dikolight', 'password', 'password')
          .catchError((err) => expect((err as Message).message, '이메일이 유효하지 않습니다'));
    });

    test('DifferentPassword', () {
      model
          .signUp('dikolight203@gmail.com', 'password', 'different_password')
          .catchError((err) => expect((err as Message).message, '비밀번호 재입력이 일치하지 않습니다'));
    });

    test('WeakPassword', () {
      model
          .signUp('dikolight203@gmail.com', 'hi', 'hi')
          .catchError((err) => expect((err as Message).message, '비밀번호가 안전하지 않습니다'));
    });

    test('ConflictEmail', () {
      when(firebaseAuthService.signUp('dikolight203@gmail.com', 'password'))
          .thenThrow(ConflictException());

      model
          .signUp('dikolight203@gmail.com', 'password', 'password')
          .catchError((err) => expect((err as Message).message, '이미 존재하는 이메일입니다'));
    });

    test('InternalServerError', () {
      when(firebaseAuthService.signUp('dikolight203@gmail.com', 'password'))
          .thenThrow(InternalException());

      model
          .signUp('dikolight203@gmail.com', 'password', 'password')
          .catchError((err) => expect((err as Message).message, '서버에 문제가 발생했습니다'));
    });

    test('Success', () {
      when(firebaseAuthService.signUp('dikolight203@gmail.com', 'password'))
          .thenAnswer((realInvocation) => Future.value());

      model
          .signUp('dikolight203@gmail.com', 'password', 'password')
          .then((value) => expect(value, null));
    });
  });
}
