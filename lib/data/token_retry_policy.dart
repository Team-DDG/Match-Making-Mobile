import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:match_making/data/pref/pref_storage.dart';

class TokenRetryPolicy implements RetryPolicy {
  final PrefStorage _prefStorage;

  TokenRetryPolicy(this._prefStorage);

  @override
  int get maxRetryAttempts => 1;

  @override
  bool shouldAttemptRetryOnException(Exception reason) {
    return true;
  }

  @override
  Future<bool> shouldAttemptRetryOnResponse(ResponseData response) async {
    if (response.statusCode == HttpStatus.unauthorized) {
      final user = await FirebaseAuth.instance.currentUser();
      if (user != null) {
        final token = await user.getIdToken(refresh: true);
        await _prefStorage.setAccessToken(token.token);
      }
      return true;
    }

    return false;
  }
}
