import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpService {
  Future<bool> signUp(String email, String password);
}

class SignUpServiceImpl implements SignUpService {
  @override
  Future<bool> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }
}
