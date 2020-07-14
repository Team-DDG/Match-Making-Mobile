import 'package:firebase_auth/firebase_auth.dart';
import 'package:match_making/data/error/firebase_error_handler.dart';

abstract class FirebaseAuthService {
  Future signUp(String email, String password);

  Future login(String email, String password);
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
}
