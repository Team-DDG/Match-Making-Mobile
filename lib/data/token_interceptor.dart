import 'package:http_interceptor/http_interceptor.dart';
import 'package:match_making/data/pref/pref_storage.dart';

class TokenInterceptor implements InterceptorContract {
  final PrefStorage _prefStorage;

  TokenInterceptor(this._prefStorage);

  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    data.headers['authorization'] = 'Bearer ${await _prefStorage.getAccessToken()}';
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async => data;
}

