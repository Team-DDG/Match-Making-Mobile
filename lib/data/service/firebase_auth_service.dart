import 'package:firebase_auth/firebase_auth.dart';
import 'package:match_making/data/error/handler/firebase_error_handler.dart';

abstract class FirebaseAuthService {
  Future signUp(String email, String password);

  Future login(String email, String password);

  Future phoneAuth(
      String phone,
      Function completed,
      Function failed,
      Function codeSent,
      Function(String verificationId) timeOut);
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

  @override
  Future phoneAuth(
      String phone,
      Function completed,
      Function failed,
      Function codeSent,
      Function(String verificationId) timeOut) async {
    final PhoneVerificationCompleted phoneVerificationCompleted = completed;
    final PhoneVerificationFailed phoneVerificationFailed = failed;
    final PhoneCodeSent phoneCodeSent = codeSent;
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: const Duration(seconds: 60),
          verificationCompleted: phoneVerificationCompleted,
          verificationFailed: phoneVerificationFailed,
          codeSent: phoneCodeSent,
          codeAutoRetrievalTimeout: timeOut);
    } catch (e) {
      FirebaseErrorHandler.throwProperException(e);
    }
  }
}
