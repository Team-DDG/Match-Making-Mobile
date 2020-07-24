import 'dart:convert';
import 'dart:io';

import 'package:match_making/data/client.dart';
import 'package:match_making/data/response/user_response.dart';

import 'file:///C:/Users/user/FlutterProjects/match_making/lib/data/error/handler/network_error_handler.dart';
import 'file:///C:/Users/user/FlutterProjects/match_making/lib/data/service/network_config.dart';

abstract class UserService {
  Future<UserResponse> getUser(String token);
}

class UserServiceImpl implements UserService {
  @override
  Future<UserResponse> getUser(String token) async {
    final response = await client.get('${BASE_URL}user');

    if (response.statusCode == HttpStatus.ok) {
      return UserResponse.fromJson(jsonDecode(response.body));
    } else {
      NetworkErrorHandler.throwProperException(response);
    }
    return null;
  }
}
