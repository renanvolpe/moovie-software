import 'package:flutter/material.dart';

class TextFieldController extends ChangeNotifier {
  TextFieldController() {
    focusNode.addListener(_handleFocusChange);
  }

  final value = ValueNotifier<String>('');
  final obscureText = ValueNotifier<bool>(false);
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

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
    notifyListeners();
  }

  void _handleFocusChange() {
    if (!focusNode.hasFocus) {
      value.value = textController.text;
      fieldKey.currentState?.validate();
      notifyListeners();
    }
  }

  @override
  void dispose() {
    focusNode.removeListener(_handleFocusChange);
    focusNode.dispose();
    textController.dispose();
    value.dispose();
    obscureText.dispose();
    super.dispose();
  }
}
