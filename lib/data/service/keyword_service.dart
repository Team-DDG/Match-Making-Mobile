import 'dart:convert';

import 'package:match_making/data/client.dart';
import 'package:match_making/data/error/handler/network_error_handler.dart';
import 'package:match_making/data/response/keyword_response.dart';
import 'package:match_making/data/service/network_config.dart';

abstract class KeywordService {
  Future<List<KeywordResponse>> getKeywords();
}

class KeywordServiceImpl implements KeywordService {
  @override
  Future<List<KeywordResponse>> getKeywords() async {
    final response = await client.get('${BASE_URL}keyword');

    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => KeywordResponse.fromJson(e))
          .toList();
    }

    NetworkErrorHandler.throwProperException(response);
    return null;
  }
}
