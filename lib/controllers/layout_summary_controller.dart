import 'package:flutter/material.dart';

class LayoutSummaryController extends ChangeNotifier {
  LayoutSummaryController() {
    title.value = listTitles.first;
  }

  ValueNotifier<String> title = ValueNotifier('');

  final List<String> listTitles = [
    'Buttons',
    'Texts',
    'TextFieldsd',
  ];

  setTitle(String text) {
    title.value = text;
    notifyListeners();
  }
}
