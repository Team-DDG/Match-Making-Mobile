import 'package:match_making/data/error/handling_method_type.dart';
import 'package:match_making/provider/base_model.dart';

class SelfCertificationModel extends BaseModel {

  Future verifyPhone(String phone) async {
    try {

    } catch(e) {
      return Future.error(Message(e.toString()));
    }
  }
}