import 'package:flutter/material.dart';

class TextFieldController extends ChangeNotifier {
  final value = ValueNotifier<String>('');
  final focusNode = FocusNode();
  final textController = TextEditingController();
  final fieldKey = GlobalKey<FormFieldState>();

  bool get hasError => fieldKey.currentState?.hasError ?? false;
  String get text => textController.text;

  set text(String newValue) {
    textController.text = newValue;
    value.value = newValue;
    notifyListeners();
  }

  TextFieldController() {
    focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (!focusNode.hasFocus) {
      // When field loses focus, update value and run validation
      value.value = textController.text;
      fieldKey.currentState?.validate(); // triggers validation
      notifyListeners();
    }
  }

  void dispose() {
    focusNode.removeListener(_handleFocusChange);
    focusNode.dispose();
    textController.dispose();
    value.dispose();
    super.dispose();
  }
}
