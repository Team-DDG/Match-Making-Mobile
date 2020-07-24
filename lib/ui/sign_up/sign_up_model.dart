import 'package:match_making/data/error/exception/conflict_exception.dart';
import 'package:match_making/data/error/exception/internal_exception.dart';
import 'package:match_making/data/error/handling_method_type.dart';
import 'package:match_making/data/firebase_auth_service.dart';
import 'package:match_making/provider/base_model.dart';
import 'package:validators/validators.dart';

class SignUpModel extends BaseModel {
  final FirebaseAuthService _firebaseAuthService;

  SignUpModel(this._firebaseAuthService);

  Future signUp(String email, String password, String reType) async {
    if (!isEmail(email)) {
      return Future.error(Message('이메일이 유효하지 않습니다'));
    }

    if (password != reType) {
      return Future.error(Message('비밀번호 재입력이 일치하지 않습니다'));
    }

    if (password.length < 6) {
      return Future.error(Message('비밀번호가 안전하지 않습니다'));
    }

    try {
      await _firebaseAuthService.signUp(email, password);
    } on ConflictException {
      return Future.error(Message('이미 존재하는 이메일입니다'));
    } on InternalException {
      return Future.error(Message('서버에 문제가 발생했습니다'));
    }
  }
}
