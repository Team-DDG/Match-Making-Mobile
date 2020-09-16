import 'package:http/http.dart';
import 'package:http_interceptor/http_client_with_interceptor.dart';
import 'package:match_making/data/pref/pref_storage_impl.dart';
import 'package:match_making/data/token_interceptor.dart';
import 'package:match_making/data/token_retry_policy.dart';

Client client = HttpClientWithInterceptor.build(
    interceptors: [TokenInterceptor(PrefStorageImpl())],
    retryPolicy: TokenRetryPolicy(PrefStorageImpl()));
