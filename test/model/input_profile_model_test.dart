import 'package:flutter_test/flutter_test.dart';
import 'package:match_making/ui/input/input_profile_model.dart';

void main()  {
  InputProfileModel model;

  setUpAll(() {
    model = InputProfileModel();
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
}
