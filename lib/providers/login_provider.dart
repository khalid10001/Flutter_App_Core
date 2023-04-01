import 'package:flutter/cupertino.dart';

enum LoginState { initial, loading, failed, succeeded }

class LoginProvider extends ChangeNotifier {
  //make singleton
  LoginProvider._privateConstructor();
  static final LoginProvider _instance = LoginProvider._privateConstructor();
  factory LoginProvider() {
    return _instance;
  }
  LoginState state = LoginState.initial;

  login(String username, String password) async {
    state = LoginState.loading;
    notifyListeners();
    //call login api
    await Future.delayed(const Duration(seconds: 2), () {});
    state = LoginState.succeeded;
    notifyListeners();
  }
}
