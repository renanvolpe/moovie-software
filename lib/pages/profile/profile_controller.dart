import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  bool _isSelected = false;
  int _indexSelected = 0;

  saveIsSelected(int index) {
    _isSelected = true;
    _indexSelected = index;
    notifyListeners();
  }

  bool get isSelected => _isSelected;
  int get indexSelected => _indexSelected;
}
