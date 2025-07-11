import 'package:flutter/foundation.dart';

class Validator {
  static bool skipValidateInDebug = false;

  static String? required(String? value, {String fieldName = 'This field'}) {
    if (skipValidateInDebug && kDebugMode) return null;
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? email(String? value) {
    if (skipValidateInDebug && kDebugMode)  return null;
    if (value == null || value.trim().isEmpty) return 'Email is required';

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) return 'Enter a valid email';
    return null;
  }

  static String? minLength(String? value, int min, {String? message}) {
    if (skipValidateInDebug && kDebugMode)  return null;
    if (value == null || value.length < min) {
      return message ?? 'Minimum length is $min characters';
    }
    return null;
  }

}