import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  bool _isLogin = true;
  bool get isLogin => _isLogin;

  void toggleMode(bool value) {
    _isLogin = value;
    notifyListeners();
  }
}
