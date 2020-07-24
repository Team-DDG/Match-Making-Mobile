import 'package:match_making/data/error/exception/internal_exception.dart';
import 'package:match_making/data/error/exception/not_found_exception.dart';
import 'package:match_making/data/error/exception/unauthorized_exception.dart';
import 'package:match_making/data/error/handling_method_type.dart';
import 'package:match_making/provider/base_model.dart';

import 'file:///C:/Users/user/FlutterProjects/match_making/lib/data/service/firebase_auth_service.dart';

class EmailLoginModel extends BaseModel {
  final FirebaseAuthService _firebaseAuthService;

  EmailLoginModel(this._firebaseAuthService);

  Future login(String email, String password) async {
    try {
      await _firebaseAuthService.login(email, password);
    } on UnauthorizedException {
      return Future.error(Message('비밀번호가 일치하지 않습니다'));
    } on NotFoundException {
      return Future.error(Message('등록된 계정이 없습니다'));
    } on InternalException {
      return Future.error(Message('서버에 문제가 발생했습니다'));
    }
  }
}
