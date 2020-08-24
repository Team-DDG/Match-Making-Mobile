import 'package:firebase_auth/firebase_auth.dart';
import 'package:match_making/data/error/handler/firebase_error_handler.dart';

abstract class FirebaseAuthService {
  Future signUp(String email, String password);

  Future login(String email, String password);

  Future phoneAuth(
      String phone,
      PhoneVerificationCompleted completed,
      PhoneVerificationFailed failed,
      PhoneCodeSent codeSent,
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
      PhoneVerificationCompleted completed,
      PhoneVerificationFailed failed,
      PhoneCodeSent codeSent,
      Function(String verificationId) timeOut) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: phone,
          timeout: const Duration(seconds: 60),
          verificationCompleted: completed,
          verificationFailed: failed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: timeOut);
    } catch (e) {
      FirebaseErrorHandler.throwProperException(e);
    }
  }
}
