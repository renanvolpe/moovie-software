import 'package:flutter/material.dart';
import 'package:movie_software/styles/color/app_color.dart';

OutlinedButtonThemeData btnOutlinedThemeLight = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: AppColors.black,
    side: const BorderSide(
      color: AppColors.black,
      width: 1,
    ),

    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),

    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
);

OutlinedButtonThemeData btnOutlinedThemeDark = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: AppColors.white,

    side: const BorderSide(
      color: AppColors.white,
      width: 1.5,
    ),

    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.3,
      fontFamily: 'lato',
    ),
  ),
);
