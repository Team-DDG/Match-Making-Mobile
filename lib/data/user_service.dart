import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:match_making/data/network_config.dart';
import 'package:match_making/data/response/user_response.dart';

import 'file:///C:/Users/user/FlutterProjects/match_making/lib/data/error/handler/network_error_handler.dart';

abstract class UserService {
  Future<UserResponse> getUser(String token);
}

class UserServiceImpl implements UserService {
  @override
  Future<UserResponse> getUser(String token) async {
    final response = await http.get('${BASE_URL}user', headers: {'authorization': 'Bearer $token'});

    if (response.statusCode == HttpStatus.ok) {
      return UserResponse.fromJson(jsonDecode(response.body));
    } else {
      NetworkErrorHandler.throwProperException(response);
    }
    return null;
  }
}
