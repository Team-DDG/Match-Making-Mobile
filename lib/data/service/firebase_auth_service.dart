import 'package:firebase_auth/firebase_auth.dart';
import 'package:match_making/data/error/handler/firebase_error_handler.dart';

abstract class FirebaseAuthService {
  Future signUp(String email, String password);

  Future login(String email, String password);

  Future phoneAuth(String phone);
}

class FirebaseAuthServiceImpl implements FirebaseAuthService {
  @override
  Future signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      FirebaseErrorHandler.throwProperException(e);
    }
  }

  @override
  Future login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      FirebaseErrorHandler.throwProperException(e);
    }
  }

  final PhoneVerificationFailed phoneVerificationFailed = (AuthException e) {};

  final PhoneVerificationCompleted phoneVerificationCompleted = (AuthCredential authCredential) {};

  final PhoneCodeSent codeSent = (String verificationId, [int forceResendingToken]) async {};

  @override
  Future phoneAuth(String phone) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(phoneNumber: phone,
          timeout: const Duration(seconds: 60),
          verificationCompleted: phoneVerificationCompleted,
          verificationFailed: phoneVerificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: (String verificationId) {});
    } catch (e) {
      FirebaseErrorHandler.throwProperException(e);
    }
  }
}
