import 'package:flutter/material.dart';
import 'package:movie_software/styles/color/app_color.dart';

var inputDecorationThemeDark = InputDecorationTheme(
  filled: true,
  fillColor: Colors.transparent,
  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
  hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.6)),

  // Normal border
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.6), width: 1.5),
    borderRadius: BorderRadius.circular(10),
  ),

  // Focused border
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.white, width: 1.8),
    borderRadius: BorderRadius.circular(10),
  ),

  // Error border
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red, width: 1.8),
    borderRadius: BorderRadius.circular(10),
  ),

  // Focused error border
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.redAccent, width: 2),
    borderRadius: BorderRadius.circular(10),
  ),

  // Label style
  labelStyle: const TextStyle(color: Colors.white),

  // Error style
  errorStyle: const TextStyle(color: Colors.redAccent, fontSize: 12),
  suffixIconColor: Colors.white,
);

var inputDecorationThemeLight = InputDecorationTheme(
  filled: true,
  fillColor: Colors.transparent,
  contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
  hintStyle: TextStyle(color: Colors.grey.shade500),

  // Default border
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.black.withValues(alpha: 0.7), width: 1.5),
    borderRadius: BorderRadius.circular(10),
  ),

  // Focused border
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.black, width: 1.8),
    borderRadius: BorderRadius.circular(10),
  ),

  // Error border
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.alizarinDark, width: 1.8),
    borderRadius: BorderRadius.circular(10),
  ),

  // Focused error border
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.alizarinDarkLight, width: 2),
    borderRadius: BorderRadius.circular(10),
  ),

  // Label style
  labelStyle: const TextStyle(color: AppColors.black),

  // Error style
  errorStyle: const TextStyle(color: AppColors.alizarinDarkLight, fontSize: 12),
  suffixIconColor: Colors.black87,
);
