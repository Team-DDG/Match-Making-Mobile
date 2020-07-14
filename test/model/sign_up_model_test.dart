import 'package:flutter_test/flutter_test.dart';
import 'package:match_making/data/error/exception/conflict_exception.dart';
import 'package:match_making/data/error/exception/internal_exception.dart';
import 'package:match_making/data/firebase_auth_service.dart';
import 'package:match_making/ui/sign_up/sign_up_model.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseAuthService extends Mock implements FirebaseAuthService {}

void main() {
  SignUpModel model;
  FirebaseAuthService firebaseAuthService;

  group('signUp', () {
    test('InvalidEmailFormat', () {
      firebaseAuthService = MockFirebaseAuthService();
      model = SignUpModel(firebaseAuthService);

      model
          .signUp('dikolight', 'password', 'password')
          .catchError((err) => expect(err, '이메일이 유효하지 않습니다'));
    });

    test('DifferentPassword', () {
      firebaseAuthService = MockFirebaseAuthService();
      model = SignUpModel(firebaseAuthService);

      model
          .signUp('dikolight203@gmail.com', 'password', 'different_password')
          .catchError((err) => expect(err, '비밀번호 재입력이 일치하지 않습니다'));
    });

    test('WeakPassword', () {
      firebaseAuthService = MockFirebaseAuthService();
      model = SignUpModel(firebaseAuthService);

      model
          .signUp('dikolight203@gmail.com', 'hi', 'hi')
          .catchError((err) => expect(err, '비밀번호가 안전하지 않습니다'));
    });

    test('ConflictEmail', () {
      firebaseAuthService = MockFirebaseAuthService();
      model = SignUpModel(firebaseAuthService);

      when(firebaseAuthService.signUp('dikolight203@gmail.com', 'password'))
          .thenThrow(ConflictException());

      model
          .signUp('dikolight203@gmail.com', 'password', 'password')
          .catchError((err) => expect(err, '이미 존재하는 이메일입니다'));
    });

    test('InternalServerError', () {
      firebaseAuthService = MockFirebaseAuthService();
      model = SignUpModel(firebaseAuthService);

      when(firebaseAuthService.signUp('dikolight203@gmail.com', 'password'))
          .thenThrow(InternalException());

      model
          .signUp('dikolight203@gmail.com', 'password', 'password')
          .catchError((err) => '서버에 문제가 발생했습니다');
    });

    test('Success', () {
      firebaseAuthService = MockFirebaseAuthService();
      model = SignUpModel(firebaseAuthService);

      when(firebaseAuthService.signUp('dikolight203@gmail.com', 'password'))
          .thenAnswer((realInvocation) => Future.value());

      model
          .signUp('dikolight203@gmail.com', 'password', 'password')
          .then((value) => expect(value, null));
    });
  });
}
