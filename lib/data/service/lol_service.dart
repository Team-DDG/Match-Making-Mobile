import 'dart:convert';

import 'package:match_making/data/client.dart';
import 'package:match_making/data/error/handler/network_error_handler.dart';
import 'package:match_making/data/response/lol_response.dart';

abstract class LolService {
  Future<LolResponse> getLolBySummonerName(Map<String, String> queryBody);
}

class LolServiceImpl extends LolService {
  @override
  Future<LolResponse> getLolBySummonerName(
      Map<String, String> queryBody) async {
    var uri = Uri.https('match-making.jepanglee.page', '/user/lol', queryBody);
    final response = await client.get(uri);

    if (response.statusCode == 200) {
      return LolResponse.fromJson(jsonDecode(response.body));
    }

    NetworkErrorHandler.throwProperException(response);
    return null;
  }
}
