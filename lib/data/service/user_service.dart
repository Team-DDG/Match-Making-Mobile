import 'dart:convert';
import 'dart:io';

import 'package:match_making/data/client.dart';
import 'package:match_making/data/error/handler/network_error_handler.dart';
import 'package:match_making/data/response/user_response.dart';
import 'package:match_making/data/service/network_config.dart';

abstract class UserService {
  Future<UserResponse> getUser(String token);

  Future postUserInformation(Map<String, dynamic> requestBody);
}

class UserServiceImpl implements UserService {
  @override
  Future<UserResponse> getUser(String token) async {
    final response = await client.get('${BASE_URL}user');

    if (response.statusCode == HttpStatus.ok) {
      return UserResponse.fromJson(jsonDecode(response.body));
    }

    NetworkErrorHandler.throwProperException(response);
    return null;
  }

  @override
  Future postUserInformation(Map<String, dynamic> requestBody) async {
    final response = await client.post('${BASE_URL}user', body: requestBody);

    if (response.statusCode == HttpStatus.ok) {
      return;
    }

    NetworkErrorHandler.throwProperException(response);
    return null;
  }
}
