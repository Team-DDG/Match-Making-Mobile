import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:match_making/data/client.dart';
import 'package:match_making/data/error/handler/network_error_handler.dart';
import 'package:match_making/data/response/lol_response.dart';
import 'package:match_making/data/service/network_config.dart';

abstract class LolService {
  Future<LolResponse> getLolBySummonerName(String summonerName);
  Future patchLolBySummonerName(String summonerName);
}

class LolServiceImpl extends LolService {
  @override
  Future<LolResponse> getLolBySummonerName(String summonerName) async {
    var uri = Uri.https('match-making.jepanglee.page', '/lol', {'summonerName': summonerName});
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return LolResponse.fromJson(jsonDecode(response.body));
    }

    NetworkErrorHandler.throwProperException(response);
    return null;
  }

  @override
  Future patchLolBySummonerName(String summonerName) async {
    final response = await client.patch('${BASE_URL}user/lol', body: {'summonerName': summonerName});
    log('response code: ${response.statusCode}');

    if(response.statusCode == 200) {
      return;
    }

    NetworkErrorHandler.throwProperException(response);
  }
}
