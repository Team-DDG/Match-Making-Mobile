import 'package:http/http.dart' as http;
import 'package:match_making/data/error/handler/network_error_handler.dart';

abstract class PhoneAuthService {
  Future verifyPhone(String phone, String code);
}

class PhoneAuthServiceImpl extends PhoneAuthService {
  @override
  Future verifyPhone(String phone, String code) async {
    var uri = Uri.https('us-central1-match-making-2b163.cloudfunctions.net', '/authPhone', {'code': code});
    final response = await http.get(uri);

    if(response.statusCode == 200) {
      return;
    }

    NetworkErrorHandler.throwProperException(response);
    return null;
  }
}