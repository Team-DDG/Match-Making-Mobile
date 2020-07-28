import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:match_making/provider/base_model.dart';

class InputProfileModel extends BaseModel {
  String _email;
  Gender _gender = Gender.MALE;
  String _playableStartTime = '00:00';
  String _playableEndTime = '00:00';

  String get email => _email;

  Gender get gender => _gender;

  String get playableStartTime => _playableStartTime;

  String get playableEndTime => _playableEndTime;

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
}

enum Gender { MALE, FEMALE }
