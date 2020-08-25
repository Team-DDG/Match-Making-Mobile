import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:match_making/data/error/exception/conflict_exception.dart';
import 'package:match_making/data/error/exception/not_found_exception.dart';
import 'package:match_making/data/error/exception/unauthorized_exception.dart';

class NetworkErrorHandler {
  static void throwProperException(Response response) {
    switch (response.statusCode) {
      case HttpStatus.notFound:  throw NotFoundException(message: jsonDecode(response.body)['message']);
      case HttpStatus.unauthorized: throw UnauthorizedException();
      case HttpStatus.conflict: throw ConflictException();
    }
  }
}