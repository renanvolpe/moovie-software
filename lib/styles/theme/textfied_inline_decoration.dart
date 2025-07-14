import 'package:flutter/material.dart';

import '../color/app_color.dart';

final inputDecorationThemeInlineDark = InputDecorationTheme(
  isDense: true,
  filled: false,
  contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
  hintStyle: TextStyle(color: AppColors.white.withOpacity(0.5)),

  border: UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.white.withOpacity(0.5), width: 1.5),
  ),

  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.white.withOpacity(0.6), width: 1.5),
  ),

  focusedBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.white, width: 1.8),
  ),

  errorBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.error, width: 1.8),
  ),

  focusedErrorBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.errorLight, width: 2),
  ),

  suffixIconColor: AppColors.white.withOpacity(0.6),
  labelStyle: const TextStyle(color: AppColors.white),
  errorStyle: const TextStyle(color: AppColors.errorLight, fontSize: 12),
);

final inputDecorationThemeInlineLight = InputDecorationTheme(
  isDense: true,
  filled: false,
  contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
  hintStyle: TextStyle(color: AppColors.black.withOpacity(0.5)),

  border: UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.black.withOpacity(0.4), width: 1.5),
  ),

  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.black.withOpacity(0.6), width: 1.5),
  ),

  focusedBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.black, width: 1.8),
  ),

  errorBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.error, width: 1.8),
  ),

  focusedErrorBorder: const UnderlineInputBorder(
    borderSide: BorderSide(color: AppColors.errorLight, width: 2),
  ),

  suffixIconColor: AppColors.black.withOpacity(0.6),
  labelStyle: const TextStyle(color: AppColors.black),
  errorStyle: const TextStyle(color: AppColors.errorLight, fontSize: 12),
);
