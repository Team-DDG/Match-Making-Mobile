import 'package:flutter/cupertino.dart';
import 'package:match_making/provider/view_state.dart';

class BaseModel with ChangeNotifier {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}