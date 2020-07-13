import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:match_making/enums/view_state.dart';

class Result {}

class Success extends Result {}

class Error extends Result {
  Error(this.errorMessage);

  String errorMessage;
}

class SignUpViewModel with ChangeNotifier {
  SignUpViewModel(this._signUpService);

  final SignUpService _signUpService;

  ViewState viewState = ViewState.Idle;

  void setViewState(ViewState viewState) {
    this.viewState = viewState;
    notifyListeners();
  }

  Future<Result> signUp(
      String email, String password, String passwordCheck) async {
    setViewState(ViewState.Busy);

    if (!isPasswordSame(password, passwordCheck)) {
      return Error('비밀번호가 일치하지 않습니당');
    }

    if (await _signUpService.signUp(email, password)) {
      setViewState(ViewState.Idle);
      return Success();
    } else {
      setViewState(ViewState.Idle);
      return Error('회원가입에 실패했습니당');
    }
  }

  bool isPasswordSame(String password, String passwordCheck) =>
      password == passwordCheck;
}

abstract class SignUpService {
  Future<bool> signUp(String email, String password);
}

class SignUpServiceImpl implements SignUpService {
  @override
  Future<bool> signUp(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }
}