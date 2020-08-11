import 'package:flutter_test/flutter_test.dart';
import 'package:match_making/data/error/exception/conflict_exception.dart';
import 'package:match_making/data/error/exception/unauthorized_exception.dart';
import 'package:match_making/data/error/handling_method_type.dart';
import 'package:match_making/data/response/keyword_response.dart';
import 'package:match_making/data/response/lol_response.dart';
import 'package:match_making/data/service/keyword_service.dart';
import 'package:match_making/data/service/lol_service.dart';
import 'package:match_making/data/service/user_service.dart';
import 'package:match_making/enum/gender.dart';
import 'package:match_making/ui/input/input_profile_model.dart';
import 'package:mockito/mockito.dart';

import '../mock/mock_keyword_service.dart';
import '../mock/mock_user_service.dart';

void main() {
  InputProfileModel model;
  UserService userService;
  KeywordService keywordService;
  LolService lolService;

  setUp(() {
    userService = MockUserService();
    keywordService = MockKeywordService();
    model = InputProfileModel(userService, keywordService, lolService);
  });

  group('switchGender', () {
    test('SwitchFromMale_ToFemale', () {
      expect(model.gender, Gender.MALE);

      model.switchGender();

      expect(model.gender, Gender.FEMALE);
    });
  });

  group('setPlayableTime', () {
    test('StartTimeFaster_ThrowException', () {
      try {
        model.setPlayableTime('12:30', '11:30');
      } catch (e) {
        expect(e.toString(), 'Exception: Start time is faster than end time!');
      }

      expect(model.playableStartTime, '00:00');
      expect(model.playableEndTime, '00:00');
    });

    test('Success', () {
      model.setPlayableTime('12:30', '13:30');

      expect(model.playableStartTime, '12:30');
      expect(model.playableEndTime, '13:30');
    });
  });

  group('setSelectedKeyword', () {
    test('SelectNewKeyword', () async {
      final keywords = [KeywordResponse(id: 0, keyword: 'KEYWORD')];
      when(keywordService.getKeywords())
          .thenAnswer((_) => Future.value(keywords));

      await model.getKeywords();
      model.setSelectedKeyword(keywords[0].id, true);

      expect(model.selectedKeywords.length, 1);
      expect(model.selectedKeywords.contains(keywords[0].id), true);
    });

    test('CancelSelectedKeywords', () async {
      final keywords = [KeywordResponse(id: 0, keyword: 'KEYWORD')];
      when(keywordService.getKeywords())
          .thenAnswer((_) => Future.value(keywords));

      await model.getKeywords();
      model.setSelectedKeyword(keywords[0].id, true);

      expect(model.selectedKeywords.length, 1);
      expect(model.selectedKeywords.contains(keywords[0].id), true);

      model.setSelectedKeyword(keywords[0].id, false);

      expect(model.selectedKeywords.length, 0);
      expect(model.selectedKeywords.contains(keywords[0].id), false);
    });
  });

  group('postUserProfile', () {
    test('TokenExpired_NavigateToLoginMethod', () {
      when(model.postUserProfile()).thenThrow(UnauthorizedException());

      model.postUserProfile().catchError((err) => {
            expect(err is Navigate, true),
            expect((err as Navigate).route, '/loginMethod')
          });
    });

    test('ConflictEmail_ShowMessage', () {
      when(model.postUserProfile()).thenThrow(ConflictException());

      model.postUserProfile().catchError((err) => {
            expect(err is Message, true),
            expect((err as Message).message, '이미 존재하는 이메일입니다')
          });
    });

    test('Success', () {
      when(model.postUserProfile()).thenAnswer((_) => Future.value());

      model.postUserProfile().then((value) => expect(value, null));
    });
  });

  group('getLolBySummonerName', () {

    test('Success', () {
      final request = {'summonerName': '나디코아니다'};
      when(lolService.getLolBySummonerName(request))
          .thenAnswer((_) => Future.value(LolResponse()));

      model.getLolBySummonerName(request).then(
          (value) => expect(value is LolResponse, true));
    });
  });
}
