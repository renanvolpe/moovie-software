import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  ValueNotifier<bool> isLogin = ValueNotifier(true);

  changeIsLogin(bool isLogin) {
    this.isLogin.value = isLogin;
    notifyListeners();
  }
}
