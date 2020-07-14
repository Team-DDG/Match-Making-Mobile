import 'package:flutter/services.dart';
import 'package:match_making/data/error/exception/conflict_exception.dart';
import 'package:match_making/data/error/exception/internal_exception.dart';
import 'package:match_making/data/error/exception/not_found_exception.dart';
import 'package:match_making/data/error/exception/unauthorized_exception.dart';

class FirebaseErrorHandler {
  static void throwProperException(Exception e) {
    if (e is PlatformException) {
      switch (e.code) {
        case 'ERROR_EMAIL_ALREADY_IN_USE': throw ConflictException();
        case 'ERROR_USER_NOT_FOUND': throw NotFoundException();
        case 'ERROR_WRONG_PASSWORD': throw UnauthorizedException();
      }
    }
    throw InternalException();
  }
}