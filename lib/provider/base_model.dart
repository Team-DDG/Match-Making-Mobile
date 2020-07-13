import 'package:flutter/cupertino.dart';

import 'file:///C:/Users/user/FlutterProjects/match_making/lib/provider/view_state.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}