import 'dart:convert';

import 'package:match_making/data/client.dart';
import 'package:match_making/data/error/handler/network_error_handler.dart';
import 'package:match_making/data/response/lol_response.dart';
import 'package:match_making/data/service/network_config.dart';

abstract class LolService {
  Future<LolResponse> getLolBySummonerName(Map<String, dynamic> queryBody);
}

class LolServiceImpl extends LolService {
  @override
  Future<LolResponse> getLolBySummonerName(Map<String, dynamic> queryBody) async {
    var uri = Uri.https(BASE_URL, 'user/lol', queryBody);
    final response = await client.get(uri);

    if(response.statusCode == 200) {
      return LolResponse.fromJson(jsonDecode(response.body));
    }

    NetworkErrorHandler.throwProperException(response);
    return null;
  }
}