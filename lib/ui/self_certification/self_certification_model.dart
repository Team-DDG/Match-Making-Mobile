import 'package:match_making/data/error/exception/unauthorized_exception.dart';
import 'package:match_making/data/error/handling_method_type.dart';
import 'package:match_making/data/service/phone_auth_service.dart';
import 'package:match_making/provider/base_model.dart';

class SelfCertificationModel extends BaseModel {
  final PhoneAuthService _phoneAuthService;

  SelfCertificationModel(this._phoneAuthService);

  Future verifyPhone(String phone, String code) async {
    try {
      _phoneAuthService.verifyPhone(phone, code);
    } on UnauthorizedException {
      return Future.error(Message('인증 번호가 올바르지 않습니다'));
    }
  }
}