import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:match_making/data/client.dart';
import 'package:match_making/data/error/handler/network_error_handler.dart';
import 'package:match_making/data/response/lol_response.dart';
import 'package:match_making/data/service/network_config.dart';

abstract class LolService {
  Future<LolResponse> getLolBySummonerName(Map<String, String> queryBody);
  Future postLolBySummonerName(Map<String, String> requestBody);
}

class LolServiceImpl extends LolService {
  @override
  Future<LolResponse> getLolBySummonerName(Map<String, String> queryBody) async {
    var uri = Uri.https('match-making.jepanglee.page', '/lol', queryBody);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return LolResponse.fromJson(jsonDecode(response.body));
    }

    NetworkErrorHandler.throwProperException(response);
    return null;
  }

  @override
  Future postLolBySummonerName(Map<String, String> requestBody) async {
    final response = await client.post('${BASE_URL}user/lol', body: requestBody);

    if(response.statusCode == 200) {
      return;
    }

    NetworkErrorHandler.throwProperException(response);
  }
}
