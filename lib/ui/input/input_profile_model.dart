import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:match_making/data/error/exception/conflict_exception.dart';
import 'package:match_making/data/error/exception/not_found_exception.dart';
import 'package:match_making/data/error/exception/unauthorized_exception.dart';
import 'package:match_making/data/error/handling_method_type.dart';
import 'package:match_making/data/response/keyword_response.dart';
import 'package:match_making/data/response/lol_response.dart';
import 'package:match_making/data/service/keyword_service.dart';
import 'package:match_making/data/service/lol_service.dart';
import 'package:match_making/data/service/user_service.dart';
import 'package:match_making/enum/gender.dart';
import 'package:match_making/provider/base_model.dart';

class InputProfileModel extends BaseModel {
  final UserService _userService;
  final KeywordService _keywordService;
  final LolService _lolService;

  InputProfileModel(this._userService, this._keywordService, this._lolService);

  String _email;

  String get email => _email;

  Gender _gender = Gender.MALE;

  Gender get gender => _gender;

  String _playableStartTime = '00:00';

  String get playableStartTime => _playableStartTime;

  String _playableEndTime = '00:00';

  String get playableEndTime => _playableEndTime;

  List<KeywordResponse> _keywords;

  List<KeywordResponse> get keywords => _keywords;

  List<int> _selectedKeywords = List();

  List<int> get selectedKeywords => _selectedKeywords;

  LolResponse _lolResponse;

  LolResponse get lolResponse => _lolResponse;

  Future getEmail() async {
    final user = await FirebaseAuth.instance.currentUser();
    _email = user.email;
    notifyListeners();
  }

  void switchGender() {
    if (gender == Gender.MALE)
      _gender = Gender.FEMALE;
    else
      _gender = Gender.MALE;

    notifyListeners();
  }

  void setPlayableTime(String start, String end) {
    if (DateFormat.Hm().parse(start).isAfter(DateFormat.Hm().parse(end))) {
      throw Exception('Start time is faster than end time!');
    }

    _playableStartTime = start;
    _playableEndTime = end;

    notifyListeners();
  }

  Future getKeywords() async {
    _keywords = await _keywordService.getKeywords();
    notifyListeners();
  }

  void setSelectedKeyword(int id, bool isSelected) {
    if (isSelected)
      _selectedKeywords.add(id);
    else
      _selectedKeywords.remove(id);
    notifyListeners();
  }

  Future postUserProfile() async {
    try {
      await _userService.postUserInformation({
        'email': email,
        'gender': gender == Gender.MALE ? 'MALE' : 'FEMALE',
        'keywords': _selectedKeywords.toString(),
        'playableEndTime': playableEndTime,
        'playableStartTime': playableStartTime
      });
      return;
    } on UnauthorizedException {
      return Future.error(Navigate('/loginMethod'));
    } on ConflictException {
      return Future.error(Message('이미 존재하는 이메일입니다'));
    }
  }

  Future<LolResponse> getLolBySummonerName(Map<String, String> queryBody) async {
    try {
      return await _lolService.getLolBySummonerName(queryBody);
    } on UnauthorizedException {
      return Future.error(Navigate('/loginMethod'));
    } on NotFoundException {
      return Future.error(Message('없는 소환사명입니다.'));
    }
  }
}
