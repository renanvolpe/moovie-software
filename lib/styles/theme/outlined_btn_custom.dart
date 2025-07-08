import 'package:flutter/material.dart';
import 'package:movie_software/styles/color/app_color.dart';

var btnFilledThemeLight = FilledButtonThemeData(
  style: FilledButton.styleFrom(
    backgroundColor: AppColors.summerSky,
    foregroundColor: AppColors.white,
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.3,
      fontFamily: 'lato',
    ),
    padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    elevation: 2,
    shadowColor: AppColors.gray.withValues(alpha: 0.9),
  ),
);

var btnFilledThemedark = FilledButtonThemeData(
  style: FilledButton.styleFrom(
    backgroundColor: AppColors.summerSky,
    foregroundColor: AppColors.white,
    textStyle: const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
       letterSpacing: 0.3,
      fontFamily: 'lato',
    ),
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    elevation: 4,
    shadowColor: AppColors.gray.withValues(alpha: 0.9),
  ),
);
